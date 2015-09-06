#!/usr/bin/env bash

source /usr/local/bin/standard.source

update_func() {
    log "Updating ark server"
    run-steamcmd +@ShutdownOnFailedCommand 1 +@NoPromptForPassword 1 +login anonymous +force_install_dir "${ARKSERVER_DIR}" +app_update 376030 +quit
    return $?
}

COUNT=0
until update_func || (( COUNT++ >= REPEAT_MAX_COUNT ))
do
    EXIT_STATUS=$?
    log "Update status failed with status: ${EXIT_STATUS}"
    log "Update count: ${COUNT} of ${REPEAT_MAX_COUNT}"
done

EXIT_STATUS=$?
log "Update exit status: ${EXIT_STATUS}"
exit $EXIT_STATUS
    