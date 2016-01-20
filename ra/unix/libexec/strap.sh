#!/usr/bin/env bash
# Usage: ra strap [target]
# Summary: Strapping 'target' environment
# Help: Strapping procedure for installing 'target' environment
local TARGET=$1
STRAP_BASE_URL='https://raw.githubusercontent.com/reyerstudio/devstrap/master'

strap_action 'strapping' $STRAP_BASE_URL "$TARGET"
