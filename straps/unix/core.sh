#!/usr/bin/env bash

set -x
set -e

OSNAME="$(uname -s)"

function core_linux() {
  echo "Strapping linux environement"
  DISTRIB=$(cat /etc/os-release | grep '^ID=' | cut -d'=' -f2 | sed s/\"//g)
  VERSION=$(cat /etc/os-release | grep '^VERSION_ID=' | cut -d'=' -f2 | sed s/\"//g)
  if [ -z "$DISTRIB" ] || [ -z "$VERSION" ]; then
    echo "Linux distribution not identified"
    exit 2
  fi
  echo "$DISTRIB $VERSION detected"

  # Install prerequisite packages
  echo "Installing prerequisite packages"
  case "$DISTRIB" in
    "ubuntu" | "debian")
      sudo apt-get install build-essential curl git m4 ruby texinfo
      ;;
    "redhat" | "centos" | "fedora")
      sudo yum groupinstall 'Development Tools' && sudo yum install curl git irb m4 ruby texinfo
      ;;
    *)
      echo "$DISTRIB distribution not supported"
      exit 3
  esac

  # TODO
  # Install ra
}

function core_darwin() {
  echo "Strapping OSX environement"

  # Install Homebrew if not installed yet
  which brew > /dev/null || ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew --version

  # TODO
  # Install ra
}

case "$OSNAME" in
  "Linux")  core_linux;;
  "Darwin") core_darwin;;
  *)
  echo "'$OSNAME' not supported"
  exit 1
esac