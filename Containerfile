FROM scratch as ctx
COPY build_files /
COPY system_files /system_files

FROM ghcr.io/ublue-os/base-main:latest

#Runs Scripts
RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
    --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    --mount=type=tmpfs,dst=/tmp \
    /ctx/initial.sh  && /ctx/pkgs.sh

# && /ctx/kernel.sh
# && /ctx/config.sh

# Run validation checks for bootc compatibility
RUN bootc container lint
