#requires -v 3
param($action)
$erroractionpreference = 'stop' # quit if anything goes wrong

function strapping() {
  "Strapping node..."
  install_or_update nodejs4
}

function unstrapping() {
  "Unstrapping node..."
  scoop uninstall nodejs4
}

Invoke-Expression "$action"
