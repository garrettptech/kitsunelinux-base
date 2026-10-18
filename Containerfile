FROM scratch as ctx

#FROM quay.io/fedora/fedora-bootc:45
FROM quay.io/fedora-ostree-desktops/base-atomic:45.20261015.0-x86_64 as base

#Build Configs
COPY build_files /
COPY system_files /

#Runs Scripts
RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
    --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    --mount=type=tmpfs,dst=/tmp \
    /ctx/build.sh

# Run validation checks for bootc compatibility
RUN bootc container lint
