#!/usr/bin/env bash
local ACTION=$1

function strapping() {
  echo "Strapping console..."
  case "$DISTRIB" in
    "osx")
      # Enable local BASH as valid shell
      grep -q $(command -v bash) /etc/shells
      if [ ! $? == 0 ]; then
        command -v bash | sudo tee -a /etc/shells > /dev/null 2>&1
      fi
      # Change shell
      if [ ! $SHELL == $(command -v bash) ]; then
        chsh -s /usr/local/bin/bash
      fi
      ;;
  esac
}

function unstrapping() {
  echo "Unstrapping console..."
  case "$DISTRIB" in
    "osx")
      # Change shell to legacy
      if [ ! $SHELL == /bin/bash ]; then
        chsh -s /bin/bash
      fi
      ;;
  esac
}

$ACTION
