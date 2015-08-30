#!/usr/bin/env bash

STEAMCMD_DIR=/home/daemon/steamcmd
ARKSERVER_DIR=/game-data/ark

pushd ${STEAMCMD_DIR}
    ./steamcmd.sh +@ShutdownOnFailedCommand 1 +@NoPromptForPassword 1 +login anonymous +force_install_dir /game-data/ark +app_update 376030 +quit
    EXIT_STATUS=$?
popd

echo "Update exit status: ${EXIT_STATUS}"
exit $EXIT_STATUS
