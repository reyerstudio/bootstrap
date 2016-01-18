#requires -v 3
param($action)
$erroractionpreference = 'stop' # quit if anything goes wrong

$devstrap = $env:DEVSTRAP_NAME, "devstrap" | select -first 1
$devstrap_home = "$HOME\$devstrap"
$gopath = "$devstrap_home\go"
$gobin = "$devstrap_home\go\bin"

function strapping() {
  "Strapping go..."
  install_or_update go
  set_env GOPATH $gopath
  add_to_path $gobin
  "GOPATH is set to $gopath"
}

function unstrapping() {
  "Unstrapping go..."
  scoop uninstall go
  unset_env GOPATH
  remove_from_path $gobin
  "GOPATH was set to $gopath"
}

Invoke-Expression "$action"
