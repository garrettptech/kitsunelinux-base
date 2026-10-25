#!/bin/bash
set -oue pipefail

# Configuration
command -v fish | tee -a /etc/shells
useradd -D -s $(command -v fish)