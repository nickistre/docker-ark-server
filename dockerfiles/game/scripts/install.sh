#!/usr/bin/env bash

STEAMCMD_DIR=/game-data/steamcmd
ARKSERVER_DIR=/game-data/ark

# Installs and setup steamcmd

if [ ! -f "${STEAMCMD_DIR}/steamcmd.sh" ]
then
    mkdir -p ${STEAMCMD_DIR}
    curl -s http://media.steampowered.com/installer/steamcmd_linux.tar.gz | tar -v -C ${STEAMCMD_DIR} -zx
fi

# Run validate
validate