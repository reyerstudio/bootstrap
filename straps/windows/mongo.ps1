#requires -v 3
param($action)
$erroractionpreference = 'stop' # quit if anything goes wrong

$mongo_ra = '# Usage: ra mongo
# Summary: Launch mongodb
# Help: Launch mongodb into $devstrap_home/db/mongo

$db = (Resolve-Path "$devstrap_home\db\mongo")

ensure "$db" > $null
mongod --nojournal --repair --dbpath "$db"
mongod --nojournal          --dbpath "$db"
'

function strapping() {
  "Strapping mongo..."
  install_or_update mongodb
  install_ra_cmd mongo $mongo_ra
  success "DBs are in $devstrap_home\db\mongo"
}

function unstrapping() {
  "Unstrapping mongo..."
  scoop uninstall mongodb
  uninstall_ra_cmd mongo
  success "DBs are still in $devstrap_home\db\mongo"
}

Invoke-Expression "$action"
