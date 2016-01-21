#requires -v 3
param($action)
$erroractionpreference = 'stop' # quit if anything goes wrong

function strapping() {
  "Strapping console..."
  install_or_update concfg
  sudo concfg import -n solarized small
  $erroractionpreference = 'SilentlyContinue' # workaround for pshazz
  install_or_update pshazz
  & "$psscriptroot\..\lib\install.ps1"
}

function unstrapping() {
  "Unstrapping console..."
  scoop uninstall pshazz
  sudo concfg clean
  scoop uninstall concfg
}

Invoke-Expression "$action"
