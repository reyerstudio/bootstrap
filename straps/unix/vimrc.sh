#!/usr/bin/env bash
local ACTION=$1

local VIM_PLUG=~/.vim/autoload/plug.vim
local VIM_RC=~/.vimrc

function strapping() {
  echo "Strapping vimrc..."

  # Install vim-plug
  curl -fLo $VIM_PLUG --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  curl -fLo $VIM_RC https://raw.githubusercontent.com/reyerstudio/devstrap/master/straps/unix/vimrc
}

function unstrapping() {
  echo "Unstrapping vimrc..."
  rm -f $VIM_PLUG
  rm -f $VIM_RC
}

$ACTION
