#!/usr/bin/env bash

STEAMCMD_DIR=/home/daemon/steamcmd
ARKSERVER_DIR=/home/daemon/steamcmd/ark

pushd ${STEAMCMD_DIR}
./steamcmd.sh +runscript update.txt
popd

pushd ${ARKSERVER_DIR}

./ShooterGame/Binaries/Linux/ShooterGameServer TheIsland?listen?SessionName=${ARKSERVER_NAME}?ServerPassword=${ARKSERVER_PASSWORD}?ServerAdminPassword=${ARKSERVER_ADMINPASSWORD} -server -log

popd