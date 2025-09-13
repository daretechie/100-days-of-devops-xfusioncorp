#!/bin/bash
# Day 36 Task 36 - Deploy nginx container

CONTAINER_NAME="nginx_1"
IMAGE="nginx:alpine"

# Run nginx container
sudo docker run -d --name "$CONTAINER_NAME" "$IMAGE"

# Verify container status
sudo docker ps --filter "name=$CONTAINER_NAME"