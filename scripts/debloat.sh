#! /bin/bash
dir=$HOME/.dotfiles

# gnome bloat cleaner
function debloat {
  echo -e "  Debloating...\n"
  bloat=$(cat $dir/lib/bloat)
  sudo pacman -Rcn --noconfirm $bloat
}

