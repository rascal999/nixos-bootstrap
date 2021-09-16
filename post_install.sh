#!/usr/bin/env bash

echo "### NixOS post install script"

# Pull dotfiles
wget https://codeload.github.com/rascal999/dotfiles/tar.gz/refs/heads/master -O $HOME/master.tar.gz
tar --strip-components=1 -xvf $HOME/master.tar.gz -C $HOME

# Clean up
rm $HOME/master.tar.gz
rm $HOME/.gitignore*
rm $HOME/README.md

# Clone repo to user directory
#mkdir $HOME/git
rm -rf $HOME/git/nixos-bootstrap-main
git clone https://github.com/rascal999/nixos-bootstrap.git $HOME/git/nixos-bootstrap-main

# Hardlink configuration.nix
sudo mv /etc/nixos/configuration.nix /etc/nixos/configuration.nix.backup
sudo ln $HOME/git/nixos-bootstrap-main/configuration.nix /etc/nixos/configuration.nix
