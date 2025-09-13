#!/bin/bash
# Day 37 Task 37 - Copy encrypted file into container

CONTAINER="ubuntu_latest"
SOURCE="/tmp/nautilus.txt.gpg"
DEST="/usr/src/"

# Copy file from host to container
sudo docker cp "$SOURCE" "$CONTAINER:$DEST"

# Verify inside the container
sudo docker exec "$CONTAINER" ls -l "$DEST"