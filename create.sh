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

# TODO: For now, these will be hard-set to ark-server and ark-rcon, but this probably should be changeable.
DOCKER_ARK_SERVER_IMAGE=ark-server
DOCKER_ARK_RCON_IMAGE=ark-rcon

# TODO: Check if containers already exist?
# Create volume container
docker create --name ${DOCKER_ARKVOLUME} -e "ARKSERVER_ADMINPASSWORD=${ARKSERVER_ADMINPASSWORD}" -v data:/game-data ${DOCKER_ARK_SERVER_IMAGE} /bin/true

# Create game container
docker create --name ${DOCKER_ARKSERVER} --volumes-from ${DOCKER_ARKVOLUME} -e  "ARKSERVER_ADMINPASSWORD=${ARKSERVER_ADMINPASSWORD}" ${DOCKER_ARK_SERVER_IMAGE}

popd
exit 0