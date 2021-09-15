#!/usr/bin/env bash

echo "### NixOS bootstrap script"

# Just in case
sudo umount /mnt/boot
sudo umount /mnt/
sudo luksClose root

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

# LUKS + ext4
sudo cryptsetup luksFormat ${DISK}1
sudo cryptsetup luksOpen ${DISK}1 root
sudo mkfs.ext4 /dev/mapper/root
sudo mkfs.fat -F 32 -n boot ${DISK}2

# Mount
sudo mount /dev/mapper/root /mnt
sudo mkdir /mnt/boot
sudo mount ${DISK}2 /mnt/boot

# NixOS
sudo nixos-generate-config --root /mnt
