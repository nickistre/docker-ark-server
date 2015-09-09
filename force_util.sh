#!/usr/bin/env bash

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

pushd ${DIR}

if [ -z ${1+x} ]
then
    echo "Must include a command, such as update or validate"
    exit 1
fi

# Run a utility command, shutting down the server without warning if it was running
# Restarts the server after utility is run.

# TODO; Check source files exists
source data/config/docker.source
source libs/settings
source libs/functions

ARKVOLUME_EXISTS=$(check_created ${DOCKER_ARKVOLUME})

if [[ $ARKVOLUME_EXISTS == 0 ]]
then
    ./create.sh
fi

ARKSERVER_RUNNING=$(check_running ${DOCKER_ARKSERVER})

if [[ $ARKSERVER_RUNNING != 0 ]]
then
    ./force_stop.sh
fi

docker run --rm -ti --volumes-from ${DOCKER_ARKVOLUME} ${DOCKER_ARK_SERVER_IMAGE} "$@"

if [[ $ARKSERVER_RUNNING != 0 ]]
then
    ./start.sh
fi

popd
exit 0