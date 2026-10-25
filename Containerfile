FROM scratch as ctx
COPY build_files /

FROM quay.io/fedora-ostree-desktops/base-atomic:45 as base
COPY system_files /

FROM ghcr.io/ublue-os/akmods-extra:ogc-45 as akmods

#Runs Scripts
RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
    --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    --mount=type=tmpfs,dst=/tmp \
    /ctx/build.sh

# Run validation checks for bootc compatibility
RUN bootc container lint
