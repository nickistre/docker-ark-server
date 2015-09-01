#!/usr/bin/env bash

# Do an update check before starting the server
update

pushd ${ARKSERVER_DIR}
ShooterGame/Binaries/Linux/ShooterGameServer TheIsland?listen?RCONEnabled=True?RCONPort=32330?ServerAdminPassword=${ARKSERVER_ADMINPASSWORD} -server -log

echo "Update exit status: ${EXIT_STATUS}"
exit $EXIT_STATUS 
