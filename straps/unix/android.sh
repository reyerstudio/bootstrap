#!/usr/bin/env bash
local ACTION=$1

function strapping() {
  echo "Strapping android..."
  brew_install_or_upgrade android-sdk
}

function unstrapping() {
  echo "Unstrapping android..."
  brew uninstall --force android-sdk
}

$ACTION
