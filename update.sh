#!/usr/bin/env bash

git pull
./post_install.sh
sudo nix-channel --update
sudo nixos-rebuild switch
