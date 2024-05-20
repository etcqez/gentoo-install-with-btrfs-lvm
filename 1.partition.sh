#!/usr/bin/env sh
set -ue

sudo mkfs.btrfs /dev/mapper/vg_linux-lv_gentoo
[[ ! -a /mnt/gentoo ]] && sudo mkdir /mnt/gentoo
sudo mount /dev/mapper/vg_linux-lv_gentoo /mnt/gentoo
sudo btrfs su cr /mnt/gentoo/@
sudo umount -R /mnt/gentoo
sudo mount -o defaults,noatime,compress=zstd,commit=120,subvol=@ /dev/mapper/vg_linux-lv_gentoo /mnt/gentoo
sudo mkdir /mnt/gentoo/efi
sudo umount /efi
sudo mount /dev/nvme0n1p1 /mnt/gentoo/efi
