#!/bin/bash
# Day 39 Task 39 - Create a new image from existing container

# Step 1: Commit the running container to a new image
sudo docker commit ubuntu_latest games:datacenter

# Step 2: Verify the new image exists
sudo docker images | grep games