#! /bin/bash
dir=$HOME/.dotfiles
sdir=$HOME/.scripts/cli

#source /usr/share/nvm/init-nvm.sh
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if [ -d $sdir ]; then
  for script in $(ls $sdir/*.sh); do
    source $script
  done
fi

