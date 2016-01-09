#requires -v 3

$erroractionpreference = 'stop' # quit if anything goes wrong

function install() {
  "Installing console environment..."
  install_or_update concfg
  sudo concfg import -n solarized small
  $erroractionpreference = 'SilentlyContinue' # workaround for pshazz
  install_or_update pshazz
}

function uninstall() {
  "Uninstalling console environment..."
}
