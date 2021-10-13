#! /bin/bash -e
dir=$HOME/.dotfiles

source $dir/scripts/debloat.sh

# AUR quick installation
function aur {
  start="$PWD"
  base=$(echo $1 | awk -F / '{ print $4 }')
  package="${base%.git}"
  echo -e "\n  installing: $package \n"
  # Create installer directory
  mkdir -p $HOME/.installers/aur
  cd $HOME/.installers/aur
  if [ ! -d "$package" ]; then
    git clone $1
  fi
  # Update installer
  cd ./$package
  git pull
  # Install package
  makepkg -si --noconfirm --needed
  cd $start
}

# Install packages
function install_pkgs {
  echo -e "  Installing: Packages...\n"
  pkgs=$(cat $dir/lib/pacman)
  sudo pacman -Syyu --noconfirm $pkgs
}

# Install AUR packages
function install_aurpkgs {
  echo -e "  Installing: AUR Packages...\n"
  aurpkgs=$(grep '^[*]' $dir/lib/aur | sed 's/*//g')
  for pkg in $aurpkgs; do
    aur "$pkg"
  done
}

# Setup zsh
function setup_zsh {
  echo -e "  Setting up: Zsh...\n"
  startdir="$PWD"
  mkdir -p $HOME/.zsh
  cd $HOME/.zsh/
  plugins=$(cat $dir/zsh/plugins)
  for plugin in $plugins; do
    git clone $plugin
  done
  cd $startdir
  ln -sf $dir/zsh/zshrc $HOME/.zshrc
  ln -sf $dir/zsh/p10k.zsh $HOME/.p10k.zsh
  chsh -s /bin/zsh
}

# Setup Neovim
function setup_nvim {
  echo -e "  Setting up: Neovim...\n"
  ln -sf $dir/nvim $HOME/.config/nvim
}

# Setup terminator
function setup_term {
  echo -e "  Setting up: Terminator...\n"
  mkdir -p $HOME/.config/terminator
  ln -sf $dir/terminator/config $HOME/.config/terminator/config
}

# Setup bpytop
function setup_bpytop {
  echo -e "  Setting up: Bpytop...\n"
  mkdir -p $HOME/.config/bpytop
  ln -sf $dir/bpytop/bpytop.conf $HOME/.config/bpytop/bpytop.conf
  ln -sfn $dir/bpytop/themes $HOME/.config/bpytop/user_themes
}

# Setup task
function setup_task {
  echo -e "  Setting up: Task...\n"
  mkdir -p $HOME/.task/themes
  ln -sf $dir/task/themes $HOME/.task/themes
  ln -sf $dir/task/taskrc $HOME/.taskrc
}

# Setup code
function setup_code {
  echo -e "  Setting up: Code...\n"
  mkdir -p $HOME/.config/Code\ -\ OSS/User
  ln -sf $dir/code/settings.json $HOME/.config/Code\ -\ OSS/User/settings.json
}

# Set gnome settings
function setup_gnome {
  echo -e "  Setting up: Gnome...\n"
  dconf load /org/gnome/desktop/wm/keybindings/ < $dir/gnome/keybindings.dconf
  dconf load /org/gnome/settings-daemon/ < $dir/gnome/settings.dconf
  sudo systemctl enable rngd
}

# Install prefered programs
function init_system {
  #install_pkgs
  if [ $? -eq 0 ]; then
    sudo usermod -aG docker $USER
    #sudo usermod -aG libvirt $USER
    git config --global pull.rebase true
    install_aurpkgs
    if [ $? -eq 0 ]; then
      setup_nvim
      setup_zsh
      #setup_term
      #setup_bpytop
      #setup_task
      #setup_code
      #setup_gnome
      #if [ $? -eq 0 ]; then
        #debloat
      #fi
    fi
  fi
}
init_system

