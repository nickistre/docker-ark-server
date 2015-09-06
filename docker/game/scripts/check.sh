#!/usr/bin/env bash

source /usr/local/bin/standard.source

log "Check that the game is installed" 

if [ ! -f "${ARKSERVER_DIR}/ShooterGame/Binaries/Linux/ShooterGameServer" ]
then
    log "Cannot find game binary, doing full validation"
    validate
fi
