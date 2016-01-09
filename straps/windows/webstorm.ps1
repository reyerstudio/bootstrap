#requires -v 3
param($action)
$erroractionpreference = 'stop' # quit if anything goes wrong

function strapping() {
  "Strapping webstorm..."
  install_or_update atom
  create_shortcut "Jetbrains WebStorm" $(scoop which webstorm)
}

function unstrapping() {
  "Unstrapping webstorm..."
  scoop uninstall atom
  delete_shortcut "Jetbrains WebStorm"
}

& $action