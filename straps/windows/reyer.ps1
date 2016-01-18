#requires -v 3
param($action)
$erroractionpreference = 'stop' # quit if anything goes wrong

$straps="console dart go mongo node"
$scoop_packs="git-flow graphviz hugo"
$node_packs="bower browser-sync gulp json-server karma karma-cli protractor typescript tsd cordova"

function strapping() {
  "Strapping reyer..."

  # Reyer environment
  ensure $HOME\$DEVSTRAP_NAME\contrib   > $null
  ensure $HOME\$DEVSTRAP_NAME\repos     > $null
  ensure $HOME\$DEVSTRAP_NAME\workspace > $null

  # Strapping
  foreach($pack in $straps.split(" ")) {
    ra strap $pack
  }

  foreach($pack in $scoop_packs.split(" ")) {
    install_or_update $pack
  }

  foreach($pack in $node_packs.split(" ")) {
    npm_install_or_upgrade $pack
  }
}

function unstrapping() {
  "Unstrapping reyer..."

  foreach($pack in $straps.split(" ")) {
    ra unstrap $pack
  }

  foreach($pack in $scoop_packs.split(" ")) {
    scoop uninstall $pack
  }
}

Invoke-Expression "$action"
