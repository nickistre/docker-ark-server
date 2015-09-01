#!/usr/bin/env bash


validate_func() {
    steamcmd +@ShutdownOnFailedCommand 1 +@NoPromptForPassword 1 +login anonymous +force_install_dir "${ARKSERVER_DIR}" +app_update 376030 validate +quit
    return $?
}

COUNT=0
until validate_func || (( COUNT++ >= REPEAT_MAX_COUNT ))
do
    EXIT_STATUS=$?
    echo "Validate status failed with status: ${EXIT_STATUS}"
    echo "Validate count: ${COUNT} of ${REPEAT_MAX_COUNT}"
    
    case ${EXIT_STATUS} in
        1)
            echo "Break detected.  Exiting script"
            exit ${EXIT_STATUS}
            ;;
    esac
done


EXIT_STATUS=$?
echo "Validate exit status: ${EXIT_STATUS}"
exit $EXIT_STATUS
