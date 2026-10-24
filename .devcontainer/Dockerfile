# OS-level packages only. Everything heavy (conda env, submodules, Renode, the
# pre-built student project) is installed into the WORKSPACE by on-create.sh,
# which runs during the Codespaces prebuild, so it is captured in the prebuild
# and lives next to the student's code.

FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=1000

RUN apt-get update && apt-get install -y --no-install-recommends \
        ca-certificates sudo git wget curl bzip2 xz-utils unzip patch file \
        build-essential make cmake ninja-build pkg-config \
        python3 python3-pip expect ccache openocd \
        libevent-dev libjson-c-dev libusb-1.0-0-dev libftdi1-dev \
        vim nano less \
    && rm -rf /var/lib/apt/lists/*

RUN groupadd --gid ${USER_GID} ${USERNAME} \
    && useradd -m -s /bin/bash --uid ${USER_UID} --gid ${USER_GID} ${USERNAME} \
    && echo "${USERNAME} ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/${USERNAME} \
    && chmod 0440 /etc/sudoers.d/${USERNAME}

USER ${USERNAME}
CMD ["/bin/bash"]
