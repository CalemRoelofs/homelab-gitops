#!/usr/bin/env bash

# Create a Ubuntu Server VM with cloud-init autoinstall

set -euxo pipefail

cd "$(dirname "$0")"

sudo dnf install -y cloud-utils

# Create seed.iso file for cloud-init
cloud-localds seed.iso user-data meta-data

virt-install \
-n test \
--description "ubuntu" \
--os-variant ubuntu24.04 \
--memory 8192 \
--vcpus 4 \
--disk path="${UBUNTU_DISK_PATH}",bus=virtio,size=50 \
--disk path=./seed.iso,format=raw,cache=none \
--graphics none \
--network bridge:br0 \
--location "${UBUNTU_ISO_PATH},kernel=casper/hwe-vmlinuz,initrd=casper/hwe-initrd" \
--noreboot \
--extra-args 'console=ttyS0,115200n8 serial autoinstall'