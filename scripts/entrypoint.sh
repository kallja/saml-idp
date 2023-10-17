#!/bin/sh

SCRIPT=$(readlink -f "$0")
SCRIPT_PATH=$(dirname "$SCRIPT")

$SCRIPT_PATH/generate-certificates.sh /application/keys idp

yarn start
