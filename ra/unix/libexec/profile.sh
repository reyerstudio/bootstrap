#!/usr/bin/env bash
# Usage: ra profile [devstrap_name]
# Summary: Install profile environment

if [ ! -z "$1" ]; then
  DEVSTRAP_NAME=$1
fi

echo "# <ra version=\"$($SCRIPT version)\">"   >  $HOME/.bashrc
echo '[ -n "$PS1" ] && source ~/.bash_profile' >> $HOME/.bashrc
echo "# </ra>"                                 >> $HOME/.bashrc

echo "# <ra version=\"$($SCRIPT version)\">" >  $HOME/.bash_profile
if [ ! -z "$DEVSTRAP_NAME" ]; then
  echo "export DEVSTRAP_NAME=$DEVSTRAP_NAME" >> $HOME/.bash_profile
fi
cat <<PROFILE >> $HOME/.bash_profile
case "\$(uname -s)" in
  "Darwin")
    source /usr/local/bin/ra init
    ;;
  "Linux")
    source /home/linuxbrew/.linuxbrew/bin/ra init
    ;;
esac
PROFILE
echo "# </ra>" >> $HOME/.bash_profile
