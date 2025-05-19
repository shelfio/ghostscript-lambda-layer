FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive
ENV GS_TAG=gs10051
ENV GS_VERSION=10.05.1

# Install system build dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    wget \
    curl \
    zip \
    gcc \
    g++ \
    make \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Build and install Ghostscript
RUN mkdir -p /usr/local/src/ghostscript && \
    cd /usr/local/src/ghostscript && \
    wget -q https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/${GS_TAG}/ghostscript-${GS_VERSION}.tar.gz && \
    tar -zxf ghostscript-${GS_VERSION}.tar.gz && \
    cd ghostscript-${GS_VERSION} && \
    ./configure --without-luratech && \
    make -j$(nproc) && \
    make install

# Package /opt directory as Lambda layer zip
RUN mkdir -p /opt/bin && \
    cp /usr/local/bin/gs /opt/bin/ && \
    cd /opt && \
    zip -r /tmp/ghostscript.zip .