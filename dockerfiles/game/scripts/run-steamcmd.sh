#!/usr/bin/env bash

STEAMCMD_DIR=/game-data/steamcmd
ARKSERVER_DIR=/game-data/ark

# Check that steam is installed
if [ ! -f "${STEAMCMD_DIR}/steamcmd.sh" ]
then
    install-steamcmd
fi

# Run steamcmd, passing all arguments
${STEAMCMD_DIR}/steamcmd.sh "$@"