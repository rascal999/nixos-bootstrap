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

sudo -i
parted $DISK -- mklabel gpt
parted $DISK -- mkpart primary 512MiB -8GiB
parted $DISK -- mkpart primary linux-swap -8GiB 100%
parted $DISK -- mkpart ESP fat32 1MiB 512MiB
parted $DISK -- set 3 esp on
