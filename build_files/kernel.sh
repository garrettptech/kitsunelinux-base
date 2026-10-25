#!/bin/bash
set -oue pipefail

#Kernel Swap 
dnf copr enable -y bieszczaders/kernel-cachyos fedora-45-x86_64
dnf versionlock add kernel-cachyos-7.2.3-cachyos1.fc45
dnf in -y kernel-cachyos kernel-cachyos-devel-matched zram-generator-defaults
#echo "protect_running_kernel=False" | sudo tee -a /etc/dnf/dnf.conf
dnf rm -y kernel-core.x86_64