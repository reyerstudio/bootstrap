#!/usr/bin/env bash
local ACTION=$1
local WSTORM_VERSION="11.0.3"

WEBSTORM_RA_INIT_UBUNTU='# IDEA 78860 - https://youtrack.jetbrains.com/issue/IDEA-78860
export IBUS_ENABLE_SYNC_MODE=1'

function strapping() {
  echo "Strapping webstorm..."
  case "$DISTRIB" in
    "osx")
      which wstorm > /dev/null
      if [ $? != 0 ]; then
        download WebStorm-${WSTORM_VERSION}-custom-jdk-bundled.dmg https://download.jetbrains.com/webstorm/WebStorm-${WSTORM_VERSION}-custom-jdk-bundled.dmg
        FILE=$RET
        open $FILE -W
        rm "$FILE"
      fi
      ;;
    "debian"|"ubuntu")
      which wstorm > /dev/null
      if [ $? != 0 ]; then
        download WebStorm-${WSTORM_VERSION}.tar.gz https://download.jetbrains.com/webstorm/WebStorm-${WSTORM_VERSION}.tar.gz
        FILE=$RET
        sudo rm -rf /opt/webstorm
        sudo mkdir -p /opt
        sudo tar xzf "$FILE" -C /opt
        sudo mv /opt/WebStorm-* /opt/webstorm
        /opt/webstorm/bin/webstorm.sh
        rm "$FILE"
      fi
      install_ra_init webstorm "$WEBSTORM_RA_INIT_UBUNTU"
      ;;
    *)
      echo "$DISTRIB not supported"
      ;;
  esac
}

function unstrapping() {
  echo "Unstrapping webstorm..."
  case "$DISTRIB" in
    "osx")
      rm -f /usr/local/bin/wstorm
      rm -rf /Applications/WebStorm.app
      ;;
    "debian"|"ubuntu")
      sudo rm -rf /opt/webstorm
      sudo rm -f /usr/local/bin/wstorm
      uninstall_ra_init webstorm
      ;;
    *)
      echo "$DISTRIB not supported"
      ;;
  esac
}

$ACTION
