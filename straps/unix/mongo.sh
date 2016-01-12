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
  brew install mongodb
  install_ra_cmd mongo "$MONGO_RA"
  echo "DBs are in $DEVSTRAP_HOME/db/mongo"
}

function unstrapping() {
  echo "Unstrapping mongo..."
  brew uninstall mongodb
  uninstall_ra_cmd mongo
  echo "DBs are in $DEVSTRAP_HOME/db/mongo"
}

$ACTION
