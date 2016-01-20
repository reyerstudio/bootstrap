#!/usr/bin/env bash

if [ -d "$HOME/.${DEVSTRAP_NAME:-devstrap}/ssh/config.d" ]; then
  echo -n > $HOME/.ssh/config
  for file in $HOME/.${DEVSTRAP_NAME:-devstrap}/ssh/config.d/*; do
    cat $file >> $HOME/.ssh/config
  done
fi

if [ -d "$HOME/.${DEVSTRAP_NAME:-devstrap}/ssh/known_hosts.d" ]; then
  echo -n > $HOME/.ssh/known_hosts
  for file in $HOME/.${DEVSTRAP_NAME:-devstrap}/ssh/known_hosts.d/*; do
    cat $file >> $HOME/.ssh/known_hosts
  done
fi

unset file
