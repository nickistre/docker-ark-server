#!/usr/bin/env bash

# Installs and setup steamcmd

mkdir -p ${STEAMCMD_DIR}
curl -s http://media.steampowered.com/installer/steamcmd_linux.tar.gz | tar -v -C ${STEAMCMD_DIR} -zx