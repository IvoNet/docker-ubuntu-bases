# Ubuntu 18.04 Supervisor base

ivonet/ubuntu:18.04 base image with supervisor support

# usage

Create new images of this one and put your services in /my_services/*.conf files
according to the [supervisor](http://supervisord.org/) specification.

make sure to start the `/usr/bin/supervisord -c /etc/supervisor/supervisord.conf`
in your entrypoint somewhere when you are ready for your services to start