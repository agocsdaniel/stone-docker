#!/bin/bash
#docker buildx create --name=container --driver=docker-container --use --bootstrap
docker buildx build --builder=container --push --platform linux/arm/v7,linux/arm64/v8,linux/amd64 --tag danca/stone:latest .
