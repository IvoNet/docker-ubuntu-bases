# My development ubuntu image
FROM ivonet/ubuntu:dev AS builder

ARG PREFIX_DIR=/usr/local/guacamole
ARG BUILD_DIR=/tmp/guacd-docker-BUILD

ARG BUILD_DEPENDENCIES=" \
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
       libvorbis-dev"

# Bring build environment up to date and install build dependencies
RUN apt-get update \
 && apt-get install -y $BUILD_DEPENDENCIES \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN mkdir -p "${PREFIX_DIR}" \
 && git clone --depth 1 https://github.com/apache/guacamole-server.git ${BUILD_DIR}\
 && cp -rv ${BUILD_DIR}/src/guacd-docker/bin "${PREFIX_DIR}/bin/" \
 && ${BUILD_DIR}/src/guacd-docker/bin/build-guacd.sh "$BUILD_DIR" "$PREFIX_DIR" \
 && ${PREFIX_DIR}/bin/list-dependencies.sh    \
            ${PREFIX_DIR}/sbin/guacd              \
            ${PREFIX_DIR}/lib/libguac-client-*.so \
            ${PREFIX_DIR}/lib/freerdp/guac*.so    \
            > ${PREFIX_DIR}/DEPENDENCIES

# My ubuntu base image with supervirsord
FROM ivonet/ubuntu:supervisor

ARG PREFIX_DIR=/usr/local/guacamole

ENV LC_ALL=C.UTF-8
ENV LD_LIBRARY_PATH=${PREFIX_DIR}/lib
ENV GUACD_LOG_LEVEL=info

ARG RUNTIME_DEPENDENCIES="            \
        ghostscript                   \
        libfreerdp-plugins-standard   \
        fonts-liberation              \
        fonts-dejavu                  \
        xfonts-terminus"

# Copy build artifacts into this stage
COPY --from=builder ${PREFIX_DIR} ${PREFIX_DIR}

# Bring runtime environment up to date and install runtime dependencies
RUN apt-get update \
 && apt-get install -y $RUNTIME_DEPENDENCIES \
 && apt-get install -y $(cat "${PREFIX_DIR}"/DEPENDENCIES)  \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* \
 && ${PREFIX_DIR}/bin/link-freerdp-plugins.sh \
    ${PREFIX_DIR}/lib/freerdp/guac*.so \
 && echo "[program:guacd]\ncommand=/usr/local/guacamole/sbin/guacd -b 0.0.0.0 -L $GUACD_LOG_LEVEL -f" > /my_services/guacd.conf

COPY entypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 4822
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/bin/bash"]

#CMD /usr/local/guacamole/sbin/guacd -b 0.0.0.0 -L $GUACD_LOG_LEVEL -f

