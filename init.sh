#!/usr/bin/env bash

echo "### NixOS bootstrap script"

# Just in case
sudo umount /mnt/boot
sudo umount /mnt/
sudo cryptsetup luksClose root

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
sudo parted $DISK -- mkpart ESP fat32 1MiB 512MiB
sudo parted $DISK -- mkpart primary 512MiB 100%
sudo parted $DISK -- set 1 esp on

BOOT_PARTITION="1"
ROOT_PARTITION="2"
NVME=`echo $DISK | grep -i nvme | wc -l`

if [[ "$NVME" == "1" ]]; then
    echo "NVME disk.."
    BOOT_PARTITION="p1"
    ROOT_PARTITION="p2"
fi

# LUKS + ext4
sudo mkfs.fat -F 32 -n boot ${DISK}${BOOT_PARTITION}
sudo cryptsetup luksFormat ${DISK}${ROOT_PARTITION}
sudo cryptsetup luksOpen ${DISK}${ROOT_PARTITION} root
sudo mkfs.ext4 /dev/mapper/root

# Mount
sudo mount /dev/mapper/root /mnt
sudo mkdir /mnt/boot
sudo mount ${DISK}${BOOT_PARTITION} /mnt/boot

# NixOS config
sudo nixos-generate-config --root /mnt
sudo cp /mnt/etc/nixos/configuration.nix /mnt/etc/nixos/configuration.nix.backup
sudo cp configuration.nix /mnt/etc/nixos/configuration.nix

# NixOS install
sleep 10
sudo nixos-install
