#!/usr/bin/env bash

# Remote install
# $ bash <(curl -sL 'https://raw.githubusercontent.com/reyerstudio/devstrap/master/straps/unix/core.sh')

set -x
set -e

OSNAME="$(uname -s)"

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
      sudo apt-get -y install build-essential curl git m4 python-setuptools ruby texinfo libbz2-dev libcurl4-openssl-dev libexpat-dev libncurses-dev zlib1g-dev
      # ra requirements
      sudo apt-get -y install coreutils curl diffutils findutils gawk git grep gzip jq less mercurial netcat openssl patch rsync sed sudo tar time vim wget
      # Enable HTTPS for apt
      sudo apt-get -y install apt-transport-https
      # Install Java 8
      sudo add-apt-repository ppa:webupd8team/java
      sudo apt-get -y update
      echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
      sudo apt-get -y install oracle-java8-installer
      sudo apt-get -y install oracle-java8-set-default
      ;;
    "redhat" | "centos" | "fedora")
      # linuxbrew requirements
      sudo yum -y groupinstall 'Development Tools' && sudo yum -y install curl git irb m4 python-setuptools ruby texinfo bzip2-devel curl-devel expat-devel ncurses-devel zlib-devel
      # ra requirements
      sudo yum -y install coreutils curl diffutils findutils gawk git grep gzip jq less mercurial nmap-ncat openssl patch rsync sed sudo tar time vim wget
      ;;
    *)
      echo "$DISTRIB distribution not supported"
      exit 3
  esac

  # Install Homebrew if not installed yet
  which brew > /dev/null || ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/linuxbrew/go/install)"

  # Export PATH with linuxbrew
  add_to_path $HOME/.linuxbrew/bin
}

function core_darwin() {
  echo "Strapping OSX environement"

  # Install Homebrew if not installed yet
  which brew > /dev/null || ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  # ra requirements
  for FORMULAE in bash bash-completion colordiff coreutils dialog dos2unix jq mercurial ncdu tree wget; do
    brew_install_or_upgrade $FORMULAE
  done
}

function install_ra() {
  # Verify and update
  brew --version
  brew update

  # Install ra
  brew tap reyerstudio/devstrap https://www.github.com/reyerstudio/devstrap
  brew_install_or_upgrade reyerstudio/devstrap/ra
}

case "$OSNAME" in
  "Linux")  core_linux;;
  "Darwin") core_darwin;;
  *)
  echo "'$OSNAME' not supported"
  exit 1
esac
install_ra
