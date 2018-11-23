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

# Source straps profile
if [ -d "$HOME/.${DEVSTRAP_NAME:-devstrap}/ra/profile.d" ]; then
  for file in $HOME/.${DEVSTRAP_NAME:-devstrap}/ra/profile.d/*.sh; do
    [ -f $file ] && [ -r $file ] && source $file
  done
fi
unset file
