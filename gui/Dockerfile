# Builder image for reduction of end image size
FROM ivonet/ubuntu:dev as builder

# Get the artifacts in a builder image to not have to clean up
ADD "http://apache.org/dyn/closer.cgi?action=download&filename=guacamole/0.9.14/binary/guacamole-0.9.14.war" /tmp/ROOT.war
ADD "http://apache.org/dyn/closer.cgi?action=download&filename=guacamole/0.9.14/binary/guacamole-auth-noauth-0.9.14.tar.gz" /tmp/guacamole-auth-noauth-0.9.14.tar.gz
WORKDIR /tmp
RUN tar -xvvf guacamole-auth-noauth-0.9.14.tar.gz

#####
# Based on the guacamole server base image
#####
FROM ivonet/ubuntu:guacd

ENV DEBIAN_FRONTEND noninteractive
ENV HOME="/root" LC_ALL="C.UTF-8" LANG="en_US.UTF-8" LANGUAGE="en_US.UTF-8" TERM="xterm" DISPLAY=":0" JAVA_OPT="-Xms8g -Xmx8g"

# Config user nobody
# TODO make it configurable at runtime
# TODO See if a normal user will work too
RUN usermod -u 99 nobody \
 && usermod -g 100 nobody \
 && usermod -m -d /nobody nobody \
 && usermod -s /bin/bash nobody \
 && usermod -a -G adm,sudo,audio,video nobody \
 && mkdir -p /nobody/.config/pulse \
 && echo 'admin ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers


RUN apt-get update -qq -y \
 && apt-get install -y --no-install-recommends \
        vnc4server \
        x11-xserver-utils \
        openbox \
        xfonts-base \
        xfonts-100dpi \
        xfonts-75dpi \
        libfuse2 \
        xrdp \
        openjdk-8-jre \
        libatinject-jsr330-api-java \
        tomcat8 \
        pulseaudio \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN rm -Rf /var/lib/tomcat8/webapps/ROOT \
 && mkdir -p /var/cache/tomcat8 \
 && mkdir -p /tmp/tomcat8-tomcat8-tmp \
 && mkdir -p /nobody/.cache/openbox/sessions \
 && chown -R nobody:users /nobody/

COPY --from=builder /tmp/guacamole-auth-noauth-0.9.14/guacamole-auth-noauth-0.9.14.jar /etc/guacamole/extensions/
COPY --from=builder /tmp/ROOT.war /var/lib/tomcat8/webapps/
COPY setup/my_services/* /my_services/
COPY setup/guacamole/* /etc/guacamole/
COPY setup/xrdp/* /etc/xrdp/
COPY setup/openbox/* /nobody/.config/openbox/


