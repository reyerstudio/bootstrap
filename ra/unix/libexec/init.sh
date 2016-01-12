#!/usr/bin/env bash
# Usage: ra init
# Summary: Initialize profile environment

add_to_path "$(brew --prefix)/bin"

if [ -d "$DEVSTRAP_RA_PROFILE" ]; then
  for FILE in $(find "$DEVSTRAP_RA_PROFILE" -name "*.sh"); do
    . $FILE
  done
fi
