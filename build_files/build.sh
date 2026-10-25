#!/bin/bash
set -oue pipefail

# Copr Plugin
sudo dnf install -y 'dnf5-command(copr)'
echo -n "max_parallel_downloads=10" >> /etc/dnf/dnf.conf

copr=(
    bieszczaders/kernel-cachyos
    atim/starship
)

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
    @virtualization 
    distrobox 
    NetworkManager
)

# Kernel Swap 
#dnf copr enable -y bieszczaders/kernel-cachyos fedora-45-x86_64
# dnf versionlock add kernel-cachyos-7.2.3-cachyos1.fc45
# dnf in -y kernel-cachyos kernel-cachyos-devel-matched zram-generator-defaults
# #echo "protect_running_kernel=False" | sudo tee -a /etc/dnf/dnf.conf
# dnf rm -y kernel-core.x86_64

#Install Pkgs and Cleanup
dnf copr enable -y atim/starship fedora-45-x86_64
dnf install -y "${drivers[@]}" "${sys_pkgs[@]}" && dnf upgrade -y --refresh && dnf autoremove -y && dnf clean all

# Configuration
#command -v fish | tee -a /etc/shells
#useradd -D -s $(command -v fish)