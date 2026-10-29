#!/bin/bash
set -oue pipefail

#Kernel Swap 
dnf copr enable -y bieszczaders/kernel-cachyos
dnf versionlock add kernel-cachyos-7.2.3-cachyos1.fc44
dnf in -y kernel-cachyos kernel-cachyos-devel-matched zram-generator-defaults
dnf rm -y kernel-core*
