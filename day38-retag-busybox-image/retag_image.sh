#!/bin/bash
# Day 38 Task 38 - Pull and re-tag BusyBox image

# Step 1: Pull the busybox:musl image
sudo docker pull busybox:musl

# Step 2: Re-tag as busybox:local
sudo docker tag busybox:musl busybox:local

# Step 3: Verify both tags exist
sudo docker images | grep busybox