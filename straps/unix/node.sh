#!/usr/bin/env bash
local ACTION=$1

function strapping() {
  echo "Strapping node..."
  case "$DISTRIB" in
    "osx")
      brew tap homebrew/versions
      brew_install_or_upgrade node4-lts
      ;;
    "ubuntu")
      curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
      sudo apt-get install -y nodejs
      ;;
    *)
      echo "$DISTRIB not supported"
      ;;
  esac
}

function unstrapping() {
  echo "Unstrapping node..."
  case "$DISTRIB" in
    "osx")
      brew uninstall --force node4-lts
      ;;
    "ubuntu")
      sudo apt-get remove -y nodejs
      ;;
    *)
      echo "$DISTRIB not supported"
      ;;
  esac
}

$ACTION
