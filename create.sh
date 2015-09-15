#!/usr/bin/env bash

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

pushd ${DIR}

# Create the docker containers

# TODO: Check source files exists
source data/config/docker.source
source configs.env
source libs/settings
source libs/functions

# Make sure images are built
./build.sh

# Check if containers already exist?
ARKSERVER_EXISTS=$(check_created ${DOCKER_ARKSERVER})
ARKSERVERVOLUME_EXISTS=$(check_created ${DOCKER_ARKVOLUME})

if [[ $ARKSERVER_EXISTS != 0 || $ARKSERVERVOLUME_EXISTS != 0 ]]
then
    ./remove.sh
fi

# Create volume container
docker create --name ${DOCKER_ARKVOLUME} -e "ARKSERVER_ADMINPASSWORD=${ARKSERVER_ADMINPASSWORD}" -v ${DIR}/data:/game-data ${DOCKER_ARK_SERVER_IMAGE} /bin/true

# Create game container
docker create --name ${DOCKER_ARKSERVER} --volumes-from ${DOCKER_ARKVOLUME} -e  "ARKSERVER_ADMINPASSWORD=${ARKSERVER_ADMINPASSWORD}" -p 27015:27015/udp -p 7778:7778/udp -p 32330:32330 ${DOCKER_ARK_SERVER_IMAGE}

popd
exit 0