#!/usr/bin/env bash
local ACTION=$1

DART_RA_INIT='# pub global
add_to_path "${PUB_CACHE:-$HOME/.pub-cache}/bin"
'

function strapping() {
  echo "Strapping dart..."
  case "$DISTRIB" in
    "osx")
      brew tap dart-lang/dart
      brew install dart --with-dartium --with-content-shell
      ;;
    "ubuntu")
      brew tap reyerstudio/linuxbrew-dart https://github.com/reyerstudio/linuxbrew-dart
      brew install dart --with-dartium --with-content-shell
      ;;
    *)
      echo "$DISTRIB not supported"
      ;;
  esac
  install_ra_init dart "$DART_RA_INIT"
}

function unstrapping() {
  echo "Unstrapping dart..."
  case "$DISTRIB" in
    "osx")
      brew uninstall dart
      brew untap dart-lang/dart
      ;;
    "ubuntu")
      brew uninstall dart
      brew untap reyerstudio/linuxbrew-dart
      ;;
    *)
      echo "$DISTRIB not supported"
      ;;
  esac
  uninstall_ra_init dart
}

$ACTION
