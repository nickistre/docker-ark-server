#!/usr/bin/env bash

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

pushd ${DIR}

# Make sure everything is setup for docker to run
if [ ! -f "configs.env" ]
then
    echo "Missing file configs.env.  Please copy configs.env.template to configs.env and set configuration options in the file"
    exit 1
fi

if [ -z ${1+x} ]
then
    echo "Need a base name for the docker containers to use!"
    exit 1
fi

# Check for data directory
if [ ! -d "data" ]
then 
    mkdir -p data
    chmod 777 data
fi

# Check for configuration directory
if [ ! -d "data/config" ]
then
    mkdir -p data/config
fi

DOCKER_SOURCE=data/config/docker.source
# Check that we don't already have a docker.source file!
if [ -f "${DOCKER_SOURCE}" ]
then
    echo "Already have a setup! Need to uninstall if needed"
    exit 1
fi

# Create docker.source file

echo "# Docker Ark Server config" > ${DOCKER_SOURCE}
echo "DOCKER_BASENAME=$1" >> ${DOCKER_SOURCE}
echo "DOCKER_ARKSERVER=\${DOCKER_BASENAME}" >> ${DOCKER_SOURCE}
echo "DOCKER_ARKVOLUME=\${DOCKER_BASENAME}_volume" >> ${DOCKER_SOURCE}

source ${DOCKER_SOURCE}


popd

exit 0