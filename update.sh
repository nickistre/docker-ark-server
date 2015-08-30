#!/usr/bin/env bash

STEAMCMD_DIR=/home/daemon/steamcmd
ARKSERVER_DIR=/game-data/ark

pushd ${STEAMCMD_DIR}
    ./steamcmd.sh +runscript update.txt
popd
