ARG ARCH
ARG OS

FROM $ARCH/debian:$OS

ARG ARCH
ARG OS
ARG ASL_REPO
ARG USER_ID
ARG GROUP_ID

RUN addgroup --gid $GROUP_ID user; exit 0
RUN adduser --disabled-password --gecos '' --uid $USER_ID --gid $GROUP_ID user; exit 0

# Install build dependencies
RUN apt-get update && apt-get -y install \
	bzip2, asciidoc-base, dh-dkms, module-assistant, tar, debhelper \
    --no-install-recommends

# Import entrypoint script
COPY ./entrypoint.sh /entrypoint.sh

# Make Executable
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
