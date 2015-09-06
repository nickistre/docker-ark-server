#!/usr/bin/env bash

source /usr/local/bin/standard.source


log "Check that server binary is available before starting it"
check

pushd ${ARKSERVER_DIR}
log "Start server"
ShooterGame/Binaries/Linux/ShooterGameServer TheIsland?listen?RCONEnabled=True?RCONPort=32330?ServerAdminPassword=${ARKSERVER_ADMINPASSWORD} -server -log

EXIT_STATUS=$?
log "Server exit status: ${EXIT_STATUS}"
exit $EXIT_STATUS 
