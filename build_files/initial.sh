#!/bin/bash
set -oue pipefail

cp -avf "/ctx/system_files"/. /
rm -rf /var/run && ln -s /run /var/run

# Copr Plugin
sudo dnf install -y 'dnf5-command(copr)'
echo -n "max_parallel_downloads=10" >> /etc/dnf/dnf.conf
