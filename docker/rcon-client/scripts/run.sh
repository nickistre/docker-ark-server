#!/usr/bin/env bash

# RCON script to connect and run a command on the ark server.

rcon -P${ARKSERVER_ENV_ARKSERVER_ADMINPASSWORD} -a${ARKSERVER_PORT_32330_TCP_ADDR} -p${ARKSERVER_PORT_32330_TCP_PORT} "$@"