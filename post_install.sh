#!/usr/bin/env bash

echo "### NixOS post install script"

# Pull dotfiles
wget https://github.com/rascal999/dotfiles/archive/refs/heads/master.zip -O $HOME/master.zip
cd $HOME/ && unzip -j -o master.zip

# Clean up
rm master.zip
rm .gitignore*
rm README.md
