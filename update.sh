#!/usr/bin/env bash

git pull
./post_install.sh
sudo nixos-rebuild switch
