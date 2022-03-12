
# Apache guacamole-server

This image has all the tools to make a build and install of the guacamole-server 
compatible for ubuntu 18.04.

It is a multi-stage build to minimize the image size.

This images is mainly meant as a base image for other images that need a guacamole server

# Build

```bash
docker build -t ivonet/guacamole-server .
docker push ivonet/guacamole-server
```

# Information

This image was created as part of my web app gui project for docker images.

One of the stages in the build is acquiring the apache guacamole server and I wanted the 
newest so I build it from the latest source on master.


# Note

Because this is a build created from the latest source it might be unstable...

# Packages

* [packages.ubuntu.com bionic](https://packages.ubuntu.com/source/bionic/guacamole-server)