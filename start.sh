#!/usr/bin/env bash

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

pushd ${DIR}


# Start the docker container

# TODO: Check source files exists
source data/config/docker.source
source libs/functions

# Check if container exists
ARKSERVER_EXISTS=$(check_created ${DOCKER_ARKSERVER})

if [[ $ARKSERVER_EXISTS == 0 ]]
then
    ./create.sh
fi

docker start ${DOCKER_ARKSERVER}

popd
exit 0