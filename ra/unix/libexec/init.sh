#!/usr/bin/env bash
# Usage: ra init
# Summary: Initialize profile environment

function add_to_path() {
  local DIR=$1
  if [[ "$PATH" =~ (^|:)"$DIR"(:|$) ]]; then
    return 0
  fi
  export PATH=$DIR:$PATH
}

function remove_from_path() {
  local DIR=$1
  PATH=$(echo $PATH | sed -e 's;:\?$DIR;;' -e 's;$DIR:\?');
}

case "$(uname -s)" in
  "Darwin")
    add_to_path "$(brew --prefix)/bin"
    ;;
  "Linux")
    add_to_path "$HOME/.linuxbrew/bin"
    ;;
esac

if [ -d "$HOME/.${DEVSTRAP_NAME:-devstrap}/ra/profile.d" ]; then
  for i in "$HOME/.${DEVSTRAP_NAME:-devstrap}/ra/profile.d/*.sh"; do
    . $i
  done
fi
