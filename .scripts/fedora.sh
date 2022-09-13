#!/usr/bin/env bash

# WARN: THESE INSTALLATION INSTRUCTIONS ARE FOR FEDORA LINUX

# Change Directory to `Downloads`
cd ~/Downloads/

# Snap Store
sudo dnf install -y snapd
sudo snap install snap-store

# Make Utilities
sudo dnf install -y make cmake automake
# C/C++
sudo dnf install -y gcc clang

# C#
rpm --import "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF"
sh -c 'curl https://download.mono-project.com/repo/centos8-stable.repo | tee /etc/yum.repos.d/mono-centos8-stable.repo'
sudo dnf update -y
sudo dnf install -y mono-devel

# JS/TS
sudo dnf install -y nodejs

# RS
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# PY
sudo dnf install -y python3

# RB
sudo dnf install -y ruby

# I3 Window Manager
sudo dnf install -y i3-gaps

# I3 Screen Locker
sudo dnf install -y xss-lock
sudo dnf install -y autoconf cairo-devel fontconfig libev-devel libjpeg-turbo-devel libXinerama libxkbcommon-devel libxkbcommon-x11-devel libXrandr pam-devel pkgconf xcb-util-image-devel xcb-util-xrm-devel
sudo dnf remove -y i3lock
git clone https://github.com/Raymo111/i3lock-color.git
cd i3lock-color
cd ~/Downloads/

# Neomutt
sudo dnf copr enable flatcap/neomutt
sudo dnf install -y neomutt

# Neovim (nightly)
sudo dnf copr enable agriffis/neovim-nightly
sudo dnf install -y neovim python3-neovim

# Lazygit
sudo dnf copr enable atim/lazygit
sudo dnf install -y lazygit

# Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Terminal Emulators (alacritty, kitty)
sudo dnf install -y alacritty kitty

# Terminal Multiplexers (tmux)
sudo dnf install -y tmux

# Miscellaneous Tools
sudo dnf install -y fd-find ripgrep rofi feh picom blueberry pavucontrol brightnessctl ncdu timeshift htop

# Instantiate Configuration Files
git clone git@github.com:ethanolx/.files.git
cd .files/
mv .git ~
cd ~
git restore .
rm -rf ~/Downloads/.files/
cd ~/Downloads/
