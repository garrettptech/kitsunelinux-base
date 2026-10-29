#!/bin/bash
set -oue pipefail

drivers=(
    ntfs-3g
    btrfs-progs
    langpacks-en
    glibc-all-langpacks
    PackageKit
)

sys_pkgs=(
    micro
    btop 
    fastfetch 
    #fish 
    #starship 
    flatpak 
    distrobox 
    @virtualization
)

#Install & Cleanup
#dnf copr enable -y atim/starship
dnf install -y "${drivers[@]}" "${sys_pkgs[@]}" && dnf rm -y firefox htop nvtop
dnf upgrade -y --refresh && dnf autoremove -y && dnf clean all