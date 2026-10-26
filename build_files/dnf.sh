#!/bin/bash
set -oue pipefail

# Copr Plugin
sudo dnf install -y 'dnf5-command(copr)'
echo -n "max_parallel_downloads=10" >> /etc/dnf/dnf.conf

