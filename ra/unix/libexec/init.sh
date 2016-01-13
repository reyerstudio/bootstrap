#!/usr/bin/env bash
# Usage: ra init
# Summary: Initialize profile environment

case "$OSNAME" in
  "Darwin")
    add_to_path "$(brew --prefix)/bin"
    ;;
  "Linux")
    add_to_path "$HOME/.linuxbrew/bin"
    ;;
esac

if [ -d "$DEVSTRAP_RA_PROFILE" ]; then
  for FILE in $(find "$DEVSTRAP_RA_PROFILE" -name "*.sh"); do
    . $FILE
  done
fi
