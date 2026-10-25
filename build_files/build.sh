#!/bin/bash
set -oue pipefail

# Copr Plugin
sudo dnf install -y 'dnf5-command(copr)'

# Kernel Swap
# dnf copr enable -y bieszczaders/kernel-cachyos 
# dnf versionlock add kernel-cachyos-7.2.3-cachyos1.fc45
# dnf in -y kernel-cachyos kernel-cachyos-devel-matched zram-generator-defaults
# #echo "protect_running_kernel=False" | sudo tee -a /etc/dnf/dnf.conf
# dnf rm -y kernel-core.x86_64

# Drivers & Etc
dnf in -y ntfs-3g btrfs-progs langpacks-en glibc-all-langpacks

# System Packages
dnf copr enable -y atim/starship
dnf in -y micro btop fastfetch fish starship flatpak @virtualization distrobox NetworkManager

# Clean Up
dnf upgrade -y --refresh && dnf autoremove -y && dnf clean all

# Configuration
#command -v fish | tee -a /etc/shells
#useradd -D -s $(command -v fish)