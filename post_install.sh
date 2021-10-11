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

# Check NVIDIA
NVIDIA=`lspci | grep VGA | grep -i nvidia | wc -l`

# Comment out
if [[ "$NVIDIA" == "0" ]]; then
   echo "NVIDIA not detected"
   sudo sed -i 's/\(services.xserver.videoDrivers = \[ "nvidia" \];\)/#\1/g' /etc/nixos/configuration.nix
fi

# twmnc sound
sudo mkdir -p $HOME/sounds
sudo cp -rf $HOME/git/nixos-bootstrap/sounds/WAV_Calm.wav $HOME/sounds

# docker swarm
docker swarm init

echo
echo "# Firefox"
echo "## Plugins"
echo "- Dark Reader"
echo "- uBlock Origin"
echo "- Foxy Proxy"
echo "- Read Aloud"
echo "## Import bookmarks"
echo
echo "# Obsidian"
echo "## Plugins"
echo "- Calendar"
echo "- Daily Notes"
echo "- Kanban"
echo "- Mindmap"
echo "- Templates"
echo
echo "# ProtonMail"
echo
echo "# The Lounge"
