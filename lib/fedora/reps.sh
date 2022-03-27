#!/bin/bash

# GPG keys
sudo rpmkeys --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc

# DNF Repositries
printf "[gitlab.com_paulcarroty_vscodium_repo]\nname=download.vscodium.com\nbaseurl=https://download.vscodium.com/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg\nmetadata_expire=1h" | sudo tee -a /etc/yum.repos.d/vscodium.repo
sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/

# Flatpak repositories
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

