#!/usr/bin/env bash
local ACTION=$1

STRAPS="console dart go mongo node"
OSX_BREW_PACKS="git-flow graphviz hugo"
UBUNTU_BREW_PACKS="hugo"
UBUNTU_DEB_PACKS="git-flow graphivz"
NODE_PACK="bower browser-sync gulp json-server karma karma-cli protractor typescript tsd cordova ios-deploy ios-sim"

REYER_RA_INIT='alias r="cd ~/${DEVSTRAP_NAME:-devstrap}"
alias rc="cd ~/${DEVSTRAP_NAME:-devstrap}/contrib"
alias rr="cd ~/${DEVSTRAP_NAME:-devstrap}/repos"
alias rw="cd ~/${DEVSTRAP_NAME:-devstrap}/workspace"
'

function strapping() {
  echo "Strapping reyer..."

  # Reyer environment
  mkdir -p $HOME/$DEVSTRAP_NAME/contrib
  mkdir -p $HOME/$DEVSTRAP_NAME/repos
  mkdir -p $HOME/$DEVSTRAP_NAME/workspace
  install_ra_init reyer "$REYER_RA_INIT"

  # Strapping
  for PACK in $STRAPS; do
    ra strap $PACK
  done

  for PACK in $NODE_PACK; do
    npm_install_or_upgrade $PACK
  done

  case "$DISTRIB" in
    "osx")
      for PACK in $OSX_BREW_PACKS; do
        brew_install_or_upgrade $PACK
      done
      ;;
    "ubuntu")
      for PACK in $UBUNTU_BREW_PACKS; do
        brew_install_or_upgrade $PACK
      done
      for PACK in $UBUNTU_DEB_PACKS; do
        sudo apt-get install -y $PACK
      done
      ;;
    *)
      echo "$DISTRIB not supported"
      ;;
  esac
}

function unstrapping() {
  echo "Unstrapping reyer..."

  # Reyer environment
  uninstall_ra_init reyer

  # Unstrapping
  for STRAP in $STRAPS; do
    ra unstrap $STRAP
  done

  case "$DISTRIB" in
    "osx")
      for PACK in $OSX_BREW_PACKS; do
        brew uninstall --force $PACK
      done
      ;;
    "ubuntu")
      for PACK in $UBUNTU_BREW_PACKS; do
        brew uninstall --force $PACK
      done
      for PACK in $UBUNTU_DEB_PACKS; do
        sudo apt-get remove -y $PACK
      done
      ;;
    *)
      echo "$DISTRIB not supported"
      ;;
  esac
}

$ACTION
