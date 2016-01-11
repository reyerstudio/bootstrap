#requires -v 3
param($action)
$erroractionpreference = 'stop' # quit if anything goes wrong

function strapping() {
  "Strapping webstorm..."
  install_or_update webstorm
  create_shortcut "Jetbrains WebStorm" $(scoop which webstorm)
}

function unstrapping() {
  "Unstrapping webstorm..."
  scoop uninstall webstorm
  delete_shortcut "Jetbrains WebStorm"
}

Invoke-Expression "$action"
