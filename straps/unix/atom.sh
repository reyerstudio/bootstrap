#!/usr/bin/env bash
local ACTION=$1

function strapping() {
  echo "Strapping atom..."
  case "$DISTRIB" in
    "osx")
      download atom-mac.zip https://atom.io/download/mac
      FILE=$RET
      unzip -d /Applications $FILE
      rm -f $FILE
      # Install shell commands
      /Applications/Atom.app/Contents/Resources/app/atom.sh
      ;;
    "debian"|"ubuntu")
      download atom.deb https://atom.io/download/deb
      FILE=$RET
      sudo dpkg -i $FILE
      ;;
    *)
      echo "$DISTRIB not supported"
      exit 1
      ;;
  esac
}

function unstrapping() {
  echo "Unstrapping atom..."
  case "$DISTRIB" in
    "osx")
      rm -rf /Applications/Atom.app
      rm -f /usr/local/bin/atom
      rm -f /usr/local/bin/apm
      ;;
    "debian"|"ubuntu")
      sudo apt-get -y remove atom
      ;;
    *)
      echo "$DISTRIB not supported"
      ;;
  esac
}

$ACTION
