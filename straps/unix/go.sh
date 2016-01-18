#!/usr/bin/env bash
local ACTION=$1

GO_RA_INIT='export GOPATH="$HOME/${DEVSTRAP_NAME:-devstrap}/go"
add_to_path "$HOME/${DEVSTRAP_NAME:-devstrap}/go/bin"'

function strapping() {
  echo "Strapping go..."
  brew_install_or_upgrade go
  mkdir -p "$DEVSTRAP_HOME/go"
  install_ra_init go "$GO_RA_INIT"
  echo "GOPATH is set to $DEVSTRAP_HOME/go"
}

function unstrapping() {
  echo "Unstrapping go..."
  brew uninstall --force go
  echo "GOPATH was set to $DEVSTRAP_HOME/go"
}

$ACTION
