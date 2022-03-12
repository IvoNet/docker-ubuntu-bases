FROM ivonet/ubuntu:dev AS builder

RUN apt-get update -y \
   && apt-get install -y --no-install-recommends \
       freerdp2-dev \
       libfreerdp-dev \
       freerdp2-x11 \
       libossp-uuid-dev \
       freerdp2-dev \
       libwebp-dev \
       libpulse-dev \
       libpng-dev \
       libcairo2-dev \
       libavcodec-dev \
       libavutil-dev \
       libswscale-dev \
       libpango1.0-dev \
       libssh2-1-dev \
       libtelnet-dev \
       libjpeg-turbo8-dev \
       libjpeg8-dev \
       libjpeg-dev \
       libvncserver-dev \
       libpulse-dev \
       libssl-dev \
       libvorbis-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /build
COPY make-guacamole-server.sh .
RUN chmod +x make-guacamole-server.sh

WORKDIR /project
CMD ["/build/make-guacamole-server.sh"]