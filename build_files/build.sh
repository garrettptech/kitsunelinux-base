#!/bin/bash
set -oue pipefail

# Copr Plugin
dnf in -y dnf-plugins-core

# Kernel Swap
dnf copr enable -y bieszczaders/kernel-cachyos
dnf in -y kernel-cachyos kernel-cachyos-devel-matched zram-generator-defaults
dnf rm -y kernel-core-*

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