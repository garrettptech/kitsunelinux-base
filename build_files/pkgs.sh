#!/bin/bash
set -oue pipefail

drivers=(
    ntfs-3g
    btrfs-progs
    langpacks-en
    glibc-all-langpacks
)

sys_pkgs=(
    micro
    btop 
    fastfetch 
    fish 
    starship 
    flatpak 
    distrobox 
    NetworkManager
    @virtualization
)

#Install & Cleanup
dnf copr enable -y atim/starship fedora-45-x86_64
dnf install -y "${drivers[@]}" "${sys_pkgs[@]}" && dnf upgrade -y --refresh && dnf autoremove -y && dnf clean all