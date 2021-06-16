#! /bin/bash
dir=$HOME/.dotfiles
sdir=$HOME/.scripts/cli

source /usr/share/nvm/init-nvm.sh

if [ -d $sdir ]; then
  for script in $(ls $sdir/*.sh); do
    source $script
  done
fi

