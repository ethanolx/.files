#!/usr/bin/env bash

# WARN: THESE INSTALLATION INSTRUCTIONS ARE FOR FEDORA LINUX

# Change Directory to `Downloads`
cd ~/Downloads/

# Snap Store
sudo pacman -S snapd
sudo snap install snap-store

# Make Utilities
sudo pacman -S make cmake automake
# C/C++
sudo pacman -S gcc clang

# C#
rpm --import "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF"
sh -c 'curl https://download.mono-project.com/repo/centos8-stable.repo | tee /etc/yum.repos.d/mono-centos8-stable.repo'
sudo pacman -S mono-devel

# JS/TS
sudo pacman -S nodejs npm

# RS
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# PY
sudo pacman -S python3

# RB
sudo pacman -S ruby

# I3 Window Manager
sudo pacman -S i3-gaps

# I3 Screen Locker
sudo pacman -S xss-lock
sudo pacman -S autoconf cairo-devel fontconfig libev-devel libjpeg-turbo-devel libXinerama libxkbcommon-devel libxkbcommon-x11-devel libXrandr pam-devel pkgconf xcb-util-image-devel xcb-util-xrm-devel
git clone https://github.com/Raymo111/i3lock-color.git
cd i3lock-color
./install-i3lock-color.sh
cd ~/Downloads/

# Neomutt
sudo pacman -S neomutt

# Neovim (nightly)
sudo pacman -S neovim

# Lazygit
sudo pacman -S lazygit

# Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Terminal Emulators (alacritty, kitty)
sudo pacman -S alacritty kitty

# Terminal Multiplexers (tmux)
sudo pacman -S tmux

# Notes (neorg)
mkdir ~/Documents/Notes/

# Miscellaneous Tools
sudo pacman -S fd ripgrep rofi feh picom blueberry bluez bluez-utils pavucontrol brightnessctl ncdu timeshift htop thunderbird pamixer

# Instantiate Configuration Files
git clone git@github.com:ethanolx/.files.git
cd .files/
mv .git ~
cd ~
git restore .
rm -rf ~/Downloads/.files/
cd ~/Downloads/

# Copy X11 Configuration Files
cd /etc/X11/
sudo cp -rf ~/.root/etc/X11/* .
cd ~/Downloads/
