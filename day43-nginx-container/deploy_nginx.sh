#!/bin/bash
# Day 43 Task 43 - Deploy nginx:alpine-perl container

IMAGE="nginx:alpine-perl"
CONTAINER_NAME="beta"
HOST_PORT=3000
CONTAINER_PORT=80

# Pull the image
sudo docker pull $IMAGE

# Run the container with port mapping
sudo docker run -d \
  --name $CONTAINER_NAME \
  -p ${HOST_PORT}:${CONTAINER_PORT} \
  $IMAGE

# Verify running status
sudo docker ps --filter "name=$CONTAINER_NAME"