#!/usr/bin/env bash

# Check that the game is minimally installed
if [ ! -f "${ARKSERVER_DIR}/ShooterGame/Binaries/Linux/ShooterGameServer" ]
then
    validate
fi
