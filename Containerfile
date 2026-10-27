FROM scratch as ctx
COPY build_files /

FROM quay.io/fedora/fedora-bootc:45 as base
COPY system_files /

#Runs Scripts
RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
    --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    --mount=type=tmpfs,dst=/tmp \
    /ctx/dnf.sh  && /ctx/pkgs.sh

#&& /ctx/kernel.sh
#&& /ctx/config.sh

# Run validation checks for bootc compatibility
RUN bootc container lint
