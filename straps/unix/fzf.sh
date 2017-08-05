#!/usr/bin/env bash
local ACTION=$1

FZF_RA_INIT='[ -f ~/.fzf.bash ] && source ~/.fzf.bash
'

function strapping() {
  echo "Strapping fzf..."
  brew_install_or_upgrade fzf
  /usr/local/opt/fzf/install --key-bindings --completion --no-update-rc
  install_ra_init fzf "$FZF_RA_INIT"
}

function unstrapping() {
  echo "Unstrapping fzf..."
  /usr/local/opt/fzf/uninstall
  brew uninstall --force fzf
  uninstall_ra_init fzf
}

$ACTION
