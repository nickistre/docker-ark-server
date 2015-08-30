#!/usr/bin/env bash

STEAMCMD_DIR=/home/daemon/steamcmd
ARKSERVER_DIR=/game-data/ark

pushd ${STEAMCMD_DIR}
./steamcmd.sh +runscript update.txt
popd

pushd ${ARKSERVER_DIR}

./ShooterGame/Binaries/Linux/ShooterGameServer TheIsland?listen?RCONEnabled=True?RCONPort=32330 -server -log

popd