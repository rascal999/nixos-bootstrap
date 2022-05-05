#!/usr/bin/env bash

echo "### NixOS post install script"

# Pull dotfiles
wget --no-check-certificate https://codeload.github.com/rascal999/dotfiles/tar.gz/refs/heads/master -O $HOME/master.tar.gz
tar --strip-components=1 -xvf $HOME/master.tar.gz -C $HOME

# Clean up
rm $HOME/master.tar.gz
rm $HOME/.gitignore*
rm $HOME/README.md

# asciinema
mkdir $HOME/asciinema

# NixOS configuration.nix
sudo mv /etc/nixos/configuration.nix /etc/nixos/configuration.nix.backup
sudo cp $HOME/git/nixos-bootstrap/configuration.nix /etc/nixos/configuration.nix

sudo mv /etc/nixos/pkgs /etc/nixos/pkgs.backup
sudo cp -rf $HOME/git/nixos-bootstrap/pkgs/ /etc/nixos/

# twmnc sound
sudo mkdir -p $HOME/sounds
sudo cp -rf $HOME/git/nixos-bootstrap/sounds/WAV_Calm.wav $HOME/sounds

# docker swarm
docker swarm init
