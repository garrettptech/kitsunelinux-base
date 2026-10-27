#!/bin/bash
set -oue pipefail

#Kernel Swap 
dnf copr enable -y bieszczaders/kernel-cachyos
dnf in -y kernel-cachyos kernel-cachyos-devel-matched zram-generator-defaults
dnf rm -y kernel-core*
