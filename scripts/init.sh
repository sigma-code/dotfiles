#! /bin/bash -e
dir=$HOME/.dotfiles

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
  sudo pacman -Syyu $pkgs
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

# Setup terminal
function setup_term {
  echo -e "  Setting up: Kitty...\n"
  mkdir -p $HOME/.config/kitty
  ln -sf $dir/kitty/kitty.conf $HOME/.config/kitty/kitty.conf
}

# Setup btop
function setup_btop {
  echo -e "  Setting up: Btop...\n"
  mkdir -p $HOME/.config/btop
  ln -sf $dir/btop/btop.conf $HOME/.config/btop/btop.conf
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
  mkdir -p $HOME/.config/VSCodium/User
  ln -sf $dir/code/settings.json $HOME/.config/VSCodium/User/settings.json
  ln -sf $dir/code/keybindings.json $HOME/.config/VSCodium/User/keybindings.json
  echo -e "installing extensions \n"
  cat $dir/code/extensions | xargs vscodium --install-extension
}

# Set gnome settings
function setup_gnome {
  echo -e "  Setting up: Gnome...\n"
  mkdir -p $HOME/.local/share/icons
  cp $dir/gnome/Zafiro-Icons-Dark $HOME/.local/share/icons
  dconf load /org/gnome/desktop/interface/ < $dir/gnome/interface.dconf
  dconf load /org/gnome/mutter/wayland/keybindings/ < $dir/gnome/restore-keys.dconf
  dconf load /org/gnome/desktop/wm/keybindings/ < $dir/gnome/keybindings.dconf
  dconf load /org/gnome/settings-daemon/plugins/media-keys/ < $dir/gnome/settings.dconf
  sudo systemctl enable rngd
}

# Set podman
function setup_podman {
  echo -e "  Setting up: Podman...\n"
  sudo sysctl kernel.unprivileged_userns_clone=1
  sudo touch /etc/subuid /etc/subgid
  sudo usermod --add-subuids 100000-165535 --add-subgids 100000-165535 $USER
}

# Set docker
function setup_docker {
  echo -e "  Setting up: Docker...\n"
  sudo systemctl enable --now docker
}

# Install prefered programs
function init_system {
  install_pkgs
  if [ $? -eq 0 ]; then
    sudo usermod -aG libvirt $USER
    git config --global pull.rebase true
    install_aurpkgs
    if [ $? -eq 0 ]; then
      setup_nvim
      setup_zsh
      setup_term
      setup_btop
      setup_code
      setup_docker
      setup_gnome
    fi
  fi
}
init_system

