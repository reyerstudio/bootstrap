#!/usr/bin/env bash
local ACTION=$1

function strapping() {
  echo "Strapping atom..."
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
  echo "Unstrapping atom..."
  case "$DISTRIB" in
    "osx")
      # Change shell to legacy
      if [ ! $SHELL == /usr/bin/bash ]; then
        chsh -s /usr/bin/bash
      fi
      ;;
  esac
}

$ACTION
