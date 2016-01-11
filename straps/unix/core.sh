#!/usr/bin/env bash

set -x
set -e

OSNAME="$(uname -s)"

function brew_install_or_upgrade() {
  if brew_is_installed "$1"; then
    if brew_is_upgradable "$1"; then
      brew upgrade "$@"
    fi
  else
    brew install "$@"
  fi
}

function brew_is_installed() {
  local name="$(brew_expand_alias "$1")"

  brew list -1 | grep -Fqx "$name"
}

function brew_is_upgradable() {
  local name="$(brew_expand_alias "$1")"

  brew outdated --quiet "$name" >/dev/null
  [[ $? -ne 0 ]]
}

function brew_expand_alias() {
  brew info "$1" 2>/dev/null | head -1 | awk '{gsub(/:/, ""); print $1}'
}

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
      # linuxbrew requirements
      sudo apt-get install build-essential curl git m4 python-setuptools ruby texinfo libbz2-dev libcurl4-openssl-dev libexpat-dev libncurses-dev zlib1g-dev
      # ra requirements
      sudo apt-get install coreutils curl diffutils findutils gawk git grep gzip jq less mercurial netcat openssl patch rsync sed sudo tar time vim wget
      ;;
    "redhat" | "centos" | "fedora")
      # linuxbrew requirements
      sudo yum yum groupinstall 'Development Tools' && sudo yum install curl git irb m4 python-setuptools ruby texinfo bzip2-devel curl-devel expat-devel ncurses-devel zlib-devel
      # ra requirements
      # TODO Add ra packages
      ;;
    *)
      echo "$DISTRIB distribution not supported"
      exit 3
  esac

  # Export PATH with linuxbrew
  export PATH=$PATH:$HOME/.linuxbrew/bin
}

function core_darwin() {
  echo "Strapping OSX environement"

  # Install Homebrew if not installed yet
  which brew > /dev/null || ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew --version
}

function install_ra() {
  # Install ra
  brew tap reyerstudio/devstrap https://www.github.com/reyerstudio/devstrap
  brew update && brew cleanup
  brew_install_or_upgrade devstrap
}

case "$OSNAME" in
  "Linux")  core_linux;;
  "Darwin") core_darwin;;
  *)
  echo "'$OSNAME' not supported"
  exit 1
esac