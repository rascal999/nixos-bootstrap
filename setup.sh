#!/usr/bin/env bash

echo "### NixOS bootstrap script"

ls /dev/disk/by-id -alh

echo -n "Disk? "
read DISK
echo $DISK

if [[ ! $(ls $DISK 2>/dev/null) ]]; then
    echo "Issue with this 'disk', does it exist?"
    exit 1
fi

# Check we're in NixOS
if [ "$HOSTNAME" != "nixos" ]; then
    echo "This doesn't look like NixOS, bailing"
    exit 1
fi

# Partition
sudo parted $DISK -- mklabel gpt
sudo parted $DISK -- mkpart primary 512MiB 100%
sudo parted $DISK -- mkpart ESP fat32 1MiB 512MiB
sudo parted $DISK -- set 2 esp on

# LUKS
sudo cryptsetup luksFormat $DISK
sudo cryptsetup luksOpen $DISK root
sudo mkfs.ext4 /dev/mapper/root
