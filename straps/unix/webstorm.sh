#!/usr/bin/env bash
local ACTION=$1
local WSTORM_VERSION="11.0.3"

function strapping() {
  echo "Strapping webstorm..."
  case "$DISTRIB" in
    "osx")
      download WebStorm-${WSTORM_VERSION}-custom-jdk-bundled.dmg https://download.jetbrains.com/webstorm/WebStorm-${WSTORM_VERSION}-custom-jdk-bundled.dmg
      FILE=$RET
      open $FILE
      echo "rm '$FILE' after installation"
      ;;
    "debian"|"ubuntu")
      download WebStorm-${WSTORM_VERSION}.tar.gz https://download.jetbrains.com/webstorm/WebStorm-${WSTORM_VERSION}.tar.gz
      FILE=$RET
      sudo rm -rf /opt/webstorm
      sudo mkdir -p /opt
      sudo tar xzf "$FILE" -C /opt
      sudo mv /opt/WebStorm-* /opt/webstorm
      /opt/webstorm/bin/webstorm.sh
      rm "$FILE"
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
      rm -rf /Applications/WebStorm.app
      ;;
    "debian"|"ubuntu")
      rm -rf /opt/webstorm
      ;;
    *)
      echo "$DISTRIB not supported"
      ;;
  esac
}

$ACTION
