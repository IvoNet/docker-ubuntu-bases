FROM ivonet/ubuntu:18.04

RUN apt-get update -qq -y\
 && apt-get install -y --no-install-recommends \
        supervisor \
 && apt-get clean \
 && ln -s /etc/supervisor/conf.d /my_services

COPY supervisor.conf /etc/supervisor/supervisor.conf