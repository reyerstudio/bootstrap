#!/usr/bin/env bash
# Usage: ra install
# Summary: Install profile environment

echo "# <ra version=\"$($SCRIPT version)\">"   >  $HOME/.bashrc
echo '[ -n "$PS1" ] && source ~/.bash_profile' >> $HOME/.bashrc
echo "# </ra>"                                 >> $HOME/.bashrc

echo "# <ra version=\"$($SCRIPT version)\">" >  $HOME/.bash_profile
if [ ! -z "$DEVSTRAP_NAME" ]; then
  echo "export DEVSTRAP_NAME=$DEVSTRAP_NAME" >> $HOME/.bash_profile
fi
echo "source $SCRIPT init"                   >> $HOME/.bash_profile
echo "# </ra>"                               >> $HOME/.bash_profile
