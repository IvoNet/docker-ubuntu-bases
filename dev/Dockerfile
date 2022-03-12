FROM ivonet/ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y \
    && apt-get install -y --no-install-recommends \
        checkinstall \
        build-essential \
        gcc \
        git \
        automake \
        autoconf \
        libtool \
        pkg-config \
        libcurl4-openssl-dev \
        intltool \
        libxml2-dev \
        libgtk2.0-dev \
        libnotify-dev \
        libglib2.0-dev \
        libevent-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /project
CMD ["/bin/bash"]