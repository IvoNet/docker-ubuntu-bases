#!/usr/bin/env bash
IMAGE_NAME=ubuntu
IMAGE_VERSION=dev

docker build -t ivonet/${IMAGE_NAME}:${IMAGE_VERSION} .
#if [ "$?" -eq 0 ]; then
#    docker push ivonet/${IMAGE_NAME}:${IMAGE_VERSION}
#fi
