#!/usr/bin/env bash
IMAGE_NAME=ubuntu
#IMAGE_VERSION=base-18.04
#curl -s https://partner-images.canonical.com/core/bionic/current/ubuntu-bionic-core-cloudimg-arm64-root.tar.gz | docker import - ivonet/${IMAGE_NAME}:${IMAGE_VERSION}
#https://partner-images.canonical.com/core/bionic/current/ubuntu-bionic-core-cloudimg-amd64-root.tar.gz
#https://partner-images.canonical.com/core/bionic/current/ubuntu-bionic-core-cloudimg-arm64-root.tar.gz
#docker push ivonet/${IMAGE_NAME}:${IMAGE_VERSION}

IMAGE_VERSION=18.04
docker build -t ivonet/${IMAGE_NAME}:${IMAGE_VERSION} .
#if [ "$?" -eq 0 ]; then
#    docker push ivonet/${IMAGE_NAME}:${IMAGE_VERSION}
#fi
