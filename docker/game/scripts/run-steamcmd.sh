#!/usr/bin/env bash

source /usr/local/bin/standard.source


log "Check that steam is installed"
if [ ! -f "${STEAMCMD_DIR}/steamcmd.sh" ]
then
    log "SteamCmd.sh not found, installing steamcmd"
    install-steamcmd
fi

log "Run steamcmd, passing all arguments: $@"
${STEAMCMD_DIR}/steamcmd.sh "$@"