#!/usr/bin/env bash

# Install Dependencies - Run from git root
./.scripts/dependencies.sh

# Install Configuration Files
cp -ri ./.config/ ~
cp -ri ./.z* ~
cp -ri ./local/share/fonts ~/.local/share/
