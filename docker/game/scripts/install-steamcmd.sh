#!/usr/bin/env bash

source /usr/local/bin/standard.source


log "Install and setup steamcmd"

mkdir -p ${STEAMCMD_DIR}
curl -s http://media.steampowered.com/installer/steamcmd_linux.tar.gz | tar -v -C ${STEAMCMD_DIR} -zx