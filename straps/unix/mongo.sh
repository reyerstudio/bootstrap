#!/usr/bin/env bash
local ACTION=$1

MONGO_RA='# Usage: ra mongo
# Summary: Launch mongodb
# Help: Launch mongodb into $DEVSTRAP_HOME/db/mongo

local DB="$DEVSTRAP_HOME/db/mongo"
mkdir -p $DB
mongod --nojournal --repair --dbpath "$DB"
mongod --nojournal          --dbpath "$DB"
'

function strapping() {
  echo "Strapping mongo..."
  case "$DISTRIB" in
    "osx")
      brew install mongodb
      ;;
    "ubuntu")
      sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
      case "$DISTRIB_VERSION" in
        "12.04")
          echo "deb http://repo.mongodb.org/apt/ubuntu precise/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
          ;;
        "14.04")
          echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
          ;;
        *)
          echo "$DISTRIB $DISTRIB_VERSION not supported"
          exit 1
      esac
      sudo apt-get update
      sudo apt-get install -y mongodb-org
      sudo service mongod stop
      ;;
    *)
      echo "$DISTRIB not supported"
      exit 1
      ;;
  esac
  install_ra_cmd mongo "$MONGO_RA"
  echo "DBs are in $DEVSTRAP_HOME/db/mongo"
}

function unstrapping() {
  echo "Unstrapping mongo..."
  case "$DISTRIB" in
    "osx")
      brew uninstall mongodb
      ;;
    "ubuntu")
      sudo apt-get -y autoremove mongodb-org
      ;;
    *)
      echo "$DISTRIB not supported"
      exit 1
      ;;
  esac
  uninstall_ra_cmd mongo
  echo "DBs are in $DEVSTRAP_HOME/db/mongo"
}

$ACTION
