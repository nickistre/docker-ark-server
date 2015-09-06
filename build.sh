#!/usr/bin/env bash

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

pushd ${DIR}

# Build the docker images.

# TODO: For now, these will be hard-set to ark-server and ark-rcon, but this probably should be changeable.
DOCKER_ARK_SERVER_IMAGE=ark-server
DOCKER_ARK_RCON_IMAGE=ark-rcon

docker build -t ${DOCKER_ARK_SERVER_IMAGE} docker/game
docker build -t ${DOCKER_ARK_RCON_IMAGE} docker/rcon-client

popd
exit 0