#!/usr/bin/env bash

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

pushd ${DIR}

WARN_MINUTES=5
SHUTDOWN_REASON="Shutting down for maintenance"

if [ -n "$1" ]
then
    SHUTDOWN_REASON="$@"
fi

# Shutdown the server gracefully, 

# TODO; Check source files exists
source data/config/docker.source
source libs/settings
source libs/functions

ARKSERVER_RUNNING=$(check_running ${DOCKER_ARKSERVER})

if [[ $ARKSERVER_RUNNING != 0 ]]
then
    echo "Container is running.  Sending broadcast to warn existing players."
    
    for COUNTDOWN in $(seq ${WARN_MINUTES} -1 1);
    do
        MESSAGE_FIRST="SHUTTING DOWN SERVER IN ${COUNTDOWN} MINUTE(S)"
        echo "Showing message:"
        echo ${MESSAGE_FIRST}
        echo ${SHUTDOWN_REASON}
        
        ./rcon.sh broadcast ${MESSAGE_FIRST}
        ./rcon.sh broadcast ${SHUTDOWN_REASON}
        
        sleep 60s
    done
    
    echo "Triggering saving on server"
    ./rcon.sh saveworld
    
    echo "Final broadcast:"
    MESSAGE_FIRST="SHUTTING DOWN SERVER NOW!"
    echo ${MESSAGE_FIRST}
    echo ${SHUTDOWN_REASON}
    
    ./rcon.sh broadcast ${MESSAGE_FIRST}
    ./rcon.sh broadcast ${SHUTDOWN_REASON}
    
    ./force_stop.sh
    
    EXIT_STATUS=$?
    exit ${EXIT_STATUS}
else
    echo "Container already stopped, nothing to do."
fi

exit 0
    