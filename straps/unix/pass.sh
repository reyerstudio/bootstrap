#!/usr/bin/env bash

local ACTION=$1

PASS_RA='# Usage: ra pass [command]
# Summary: Manage pass
# Help: Manage pass (the standard unix password manager)
# Commands
#   add [name] [location]   Add pass store server
#   list                    List pass store servers
#   status                  Status of pass store servers
#   status [name]           Status of [name] pass store server
#   pull                    Pull from pass store servers
#   pull [name]             Pull from [name] pass store server
#   push                    Push to pass store servers
#   push [name]             Push to [name] pass store server
#   upgrade                 Upgrade pass extensions
#   help                    Help

set -e
#set -x

ACTION=$1

PASS_STORE=$HOME/.password-store
RA_PASS_STORE=$HOME/.$DEVSTRAP/pass/store.d

function add() {
  local NAME=$1
  local LOCATION=$2
  if [[ "$NAME" == "" || "$LOCATION" == "" ]]; then
    ra pass help
    exit 1
  fi
  echo "Add [$NAME] from [$LOCATION]"
  echo "PASSWORD_STORE_DIR=$PASS_STORE/$NAME PASSWORD_STORE_GIT=$PASS_STORE/$NAME" > $RA_PASS_STORE/$NAME
  git clone $LOCATION $PASS_STORE/$NAME
}

function list() {
  cd $RA_PASS_STORE
  ls -1 | sort
}

function _git() {
  local CMD=$1
  local NAME=$2
  local NAMES
  if [[ "$NAME" == "" ]]; then
    NAMES=$(list)
  else
    NAMES=$NAME
  fi
  for N in $NAMES; do
    echo "-----------------------------------------------------------------"
    echo $N
    echo "-----------------------------------------------------------------"
    eval "$(cat $RA_PASS_STORE/$N) pass git $CMD"
  done
}

function status() {
  _git status $1
}

function pull() {
  _git pull $1
}

function push() {
  _git push $1
}

function upgrade() {
  # Select PREFIX
  case "$DISTRIB" in
    "osx")
      EXTS="/usr/local/lib/password-store/extensions"
      INSTALL="make install PREFIX=/usr/local"
      curl -q https://git.zx2c4.com/password-store/plain/contrib/dmenu/passmenu > /usr/local/bin/passmenu
      chmod 755 /usr/local/bin/passmenu
      ;;
    "ubuntu")
      EXTS="/usr/lib/password-store/extensions"
      INSTALL="sudo make install"
      sudo bash -c "curl -q https://git.zx2c4.com/password-store/plain/contrib/dmenu/passmenu > /usr/local/bin/passmenu"
      sudo chmod 755 /usr/local/bin/passmenu
      ;;
    *)
      echo "$DISTRIB not supported"
      exit 1
      ;;
  esac

  # Install pass-update
  cd
  git clone https://github.com/roddhjav/pass-update /tmp/pass-update
  cd /tmp/pass-update
  eval $INSTALL
  rm -rf /tmp/pass-update

  # Install pass-otp
  cd
  git clone https://github.com/tadfisher/pass-otp /tmp/pass-otp
  cd /tmp/pass-otp
  eval $INSTALL
  rm -rf /tmp/pass-otp

  # Install pass-tail
  cd
  git clone https://github.com/palortoff/pass-extension-tail /tmp/pass-tail
  cd /tmp/pass-tail/src
  sudo install tail.bash tailedit.bash $EXTS
  rm -rf /tmp/pass-tail
}

shift
case "$ACTION" in
  "add")
    add $*
    exit 0
    ;;
  "list")
    list
    exit 0
    ;;
  "status")
    status $*
    exit 0
    ;;
  "pull")
    pull $*
    exit 0
    ;;
  "push")
    push $*
    exit 0
    ;;
  "upgrade")
    upgrade
    exit 0
    ;;
esac
ra help pass
exit 1
'

PASS_RA_INIT='export PASSWORD_STORE_ENABLE_EXTENSIONS=true'

RA_PASS_STORE=$HOME/.$DEVSTRAP/pass/store.d

function strapping() {
  echo "Strapping pass..."
  case "$DISTRIB" in
    "osx")
      brew install oath-toolkit pass
      ;;
    "ubuntu")
      sudo apt-get install dmenu oathtool pass
      ;;
    *)
      echo "$DISTRIB not supported"
      exit 1
      ;;
  esac
  install_ra_cmd pass "$PASS_RA"
  install_ra_init pass "$PASS_RA_INIT"
  ra pass upgrade
  mkdir -p $RA_PASS_STORE
}

function unstrapping() {
  echo "Unstrapping pass..."

  case "$DISTRIB" in
    "osx")
      brew uninstall pass
      ;;
    "ubuntu")
      sudo apt-get remove --purge pass
      ;;
    *)
      echo "$DISTRIB not supported"
      exit 1
      ;;
  esac
  uninstall_ra_cmd pass
  uninstall_ra_init pass
  sudo rm -f /usr/local/bin/passmenu
}

$ACTION