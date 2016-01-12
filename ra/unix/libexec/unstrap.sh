#!/usr/bin/env bash
# Usage: ra unstrap [target]
# Summary: Unstrapping 'target' environment
# Help: Unstrapping procedure for removing 'target' environment
local TARGET=$1
STRAP_BASE_URL='https://raw.githubusercontent.com/reyerstudio/devstrap/master'

strap_action 'unstrapping' $STRAP_BASE_URL $TARGET
