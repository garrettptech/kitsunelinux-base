FROM quay.io/fedora/fedora-bootc:45

# Copr Plugin
RUN dnf in -y 'dnf5-command(copr)'

# Kernel swap
RUN dnf copr enable -y bieszczaders/kernel-cachyos
RUN dnf in -y kernel-cachyos kernel-cachyos-devel-matched zram-generator-defaults
RUN dnf rm -y kernel-core-*

# Drivers \ Networking
RUN dnf in -y ntfs-3g btrfs-progs langpacks-en glibc-all-langpacks NetworkManager

# System Packages
RUN dnf copr enable -y atim/starship
RUN dnf in -y micro btop fastfetch fish starship flatpak 

# Remove fedora repo before environment
#RUN flatpak remote-delete fedora

# Clean Up
RUN dnf rm -y rpm-ostree
RUN dnf upgrade -y --refresh && dnf autoremove -y && dnf clean all

# Configuration
COPY ./configs/* /etc/
RUN command -v fish | tee -a /etc/shells
RUN useradd -D -s $(command -v fish)

# OS Release
RUN echo -e 'NAME="KitsuneLinux"\n\
PRETTY_NAME="KitsuneLinux"\n\
ID=fedora\n\
LOGO=kitsune-logo\n\
VERSION_ID=v0.1rc2\n\
DEFAULT_HOSTNAME="kitsunelinux"' > /etc/os-release

# Run validation checks for bootc compatibility
RUN bootc container lint
