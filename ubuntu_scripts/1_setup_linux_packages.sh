#!/bin/bash

## Updates existing packages and upgrades

sudo apt update && sudo apt upgrade -y

## The following list only includes packages
## I need for development.  I will keep it
## updated as I install new packages.
## Lastly, this could take a little bit!

sudo apt install -y \
    build-essential \
    libnss3 \
    make \
    libssl-dev \
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    wget \
    curl \
    llvm \
    libncurses5-dev \
    xz-utils \
    tk-dev \
    libxml2-dev \
    libxmlsec1-dev \
    libffi-dev \
    liblzma-dev \
    jq \
    xclip \
    direnv \
    fuse \
    tmux \
    apt-transport-https \
    ca-certificates \
    gnupg2 \
    software-properties-common \
    fontconfig \
    git \
    python-openssl \
    libsnappy-dev \
    python3-pip \
    libpq-dev \
    python-pip \
    awscli