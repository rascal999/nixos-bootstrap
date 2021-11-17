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

# twmnc sound
sudo mkdir -p $HOME/sounds
sudo cp -rf $HOME/git/nixos-bootstrap/sounds/WAV_Calm.wav $HOME/sounds

# docker swarm
docker swarm init

echo
echo "# Firefox"
echo "## Plugins"
echo "- CanvasBlocker"
echo "- ClearURLs"
echo "- Dark Reader"
echo "- Foxy Proxy"
echo "- LocalCDN"
echo "- Read Aloud"
echo "- MetaMask"
echo "- Privacy Badger"
echo "- uBlock Origin"
echo "## Import bookmarks"
echo
echo "# Obsidian"
echo "## Plugins"
echo "- Advanced Tables"
echo "- Calendar"
echo "- Copy button for code blocks"
echo "- Daily Notes"
echo "- Day Planner"
echo "- Dictionary"
echo "- Editor Syntax Highlight"
echo "- Kanban"
echo "- Mind Map"
echo "- Ozan's Image in Editor Plugin"
echo "- Paste URL into selection"
echo "- Recent Files"
echo "- Spaced Repetition"
echo "- Templates"
echo "- Templater"
echo
echo "# ProtonMail"
echo
