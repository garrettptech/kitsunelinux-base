#!/bin/bash

# Copr Plugin
dnf in -y 'dnf5-command(copr)'

# Kernel swap
dnf copr enable -y bieszczaders/kernel-cachyos
dnf in -y kernel-cachyos kernel-cachyos-devel-matched zram-generator-defaults
dnf rm -y kernel-core-*

# Drivers \ Networking
dnf in -y ntfs-3g btrfs-progs langpacks-en glibc-all-langpacks NetworkManager

# System Packages
dnf copr enable -y atim/starship
dnf in -y micro btop fastfetch fish starship flatpak 

# Remove fedora repo before environment
#flatpak remote-delete fedora

# Clean Up
dnf upgrade -y --refresh && dnf autoremove -y && dnf clean all

# Configuration
#command -v fish | tee -a /etc/shells
#useradd -D -s $(command -v fish)