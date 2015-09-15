#!/usr/bin/env bash

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

pushd ${DIR}

# TODO: Check source files exists
source data/config/docker.source
source configs.env
source libs/settings
source libs/functions

# run rcon command in container
docker run -ti --rm --link ${DOCKER_ARKSERVER}:arkserver ${DOCKER_ARK_RCON_IMAGE} "$@"

EXIT_VALUE=$?

exit ${EXIT_VALUE}