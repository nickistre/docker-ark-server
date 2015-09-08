#!/usr/bin/env bash

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

pushd ${DIR}

# Remove existing containers

# TODO: Check source files exists
source data/config/docker.source

# TODO: Check if containers actually exist?
# Remove containers
docker rm ${DOCKER_ARKSERVER}
docker rm ${DOCKER_ARKVOLUME}

popd
exit 0
