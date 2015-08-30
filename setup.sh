#!/usr/bin/env bash

# Make sure everything is setup for docker to run
if [ ! -f "config.yml" ]
then
    echo "Missing file config.yml.  Please copy config.yml.template to config.yml and set configuration options in the file"
fi