#!/usr/bin/env bash

source /usr/local/bin/standard.source

validate_func() {
    log "Validating ark server"
    run-steamcmd +@ShutdownOnFailedCommand 1 +@NoPromptForPassword 1 +login anonymous +force_install_dir "${ARKSERVER_DIR}" +app_update 376030 validate +quit
    return $?
}

COUNT=0
until validate_func || (( COUNT++ >= REPEAT_MAX_COUNT ))
do
    EXIT_STATUS=$?
    log "Validate status failed with status: ${EXIT_STATUS}"
    log "Validate count: ${COUNT} of ${REPEAT_MAX_COUNT}"
done


EXIT_STATUS=$?
log "Validate exit status: ${EXIT_STATUS}"
exit $EXIT_STATUS
