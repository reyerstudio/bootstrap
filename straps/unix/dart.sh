#!/usr/bin/env bash
local ACTION=$1

function strapping() {
  echo "Strapping dart..."
  case "$DISTRIB" in
    "osx")
      brew tap dart-lang/dart
      brew install dart --with-dartium --with-content-shell
      ;;
    "ubuntu")
      sudo sh -c 'curl https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -'
      sudo sh -c 'curl https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_stable.list > /etc/apt/sources.list.d/dart_stable.list'
      sudo sh -c 'curl https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_unstable.list > /etc/apt/sources.list.d/dart_unstable.list'
      sudo apt-get -y install dart
      ;;
    *)
      echo "$DISTRIB not supported"
      ;;
  esac
}

function unstrapping() {
  echo "Unstrapping dart..."
  case "$DISTRIB" in
    "osx")
      brew uninstall dart
      brew untap dart-lang/dart
      ;;
    "ubuntu")
      sudo apt-get -y remove dart
      ;;
    *)
      echo "$DISTRIB not supported"
      ;;
  esac
}

$ACTION
