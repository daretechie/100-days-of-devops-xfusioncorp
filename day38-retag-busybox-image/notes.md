# Day 38: Pull and Re-Tag a Docker Image

## Objective

The goal for today was to pull a specific Docker image from a registry and then apply a new, local-use tag to it without altering the original image. This is a common practice for versioning, testing, or preparing images for a different environment.

## Key Concepts

### Docker Image Tagging

A Docker image is identified by a unique ID (a SHA256 hash). A tag is simply a human-readable label or alias that points to a specific image ID.

- **One Image, Multiple Tags:** A single Docker image can have multiple tags. For example, `ubuntu:22.04` and `ubuntu:latest` might point to the exact same image ID.
- **Lightweight Operation:** The `docker tag` command is an inexpensive operation. It doesn't duplicate the image layers; it just creates a new reference (the new tag) that points to the existing image ID.

## Command Breakdown

The task was accomplished with the following shell script (`retag_image.sh`):

```bash
#!/bin/bash
# Day 38 Task 38 - Pull and re-tag BusyBox image

# Step 1: Pull the busybox:musl image
# Fetches the image from the Docker Hub registry.
# 'musl' refers to a version built with the musl C standard library,
# known for being lightweight and static.
sudo docker pull busybox:musl

# Step 2: Re-tag as busybox:local
# Creates a new tag 'busybox:local' that points to the same
# image ID as 'busybox:musl'.
sudo docker tag busybox:musl busybox:local

# Step 3: Verify both tags exist
# Lists all images and filters for 'busybox' to confirm
# that both tags are present and share the same IMAGE ID.
sudo docker images | grep busybox
```

## Verification

After running the script, the `docker images` command confirms the result. The output shows two tags pointing to the same image ID, proving that the re-tagging was successful and did not create a new image.

**Expected Output:**

```
busybox   local    <image_id>   ...
busybox   musl     <image_id>   ...
```
*(Note: `<image_id>` will be the same for both entries)*

## Key Takeaway

Re-tagging is a fundamental Docker skill for managing image lifecycles. It allows you to create meaningful, context-specific labels for images without consuming extra disk space, making it efficient for development, testing, and deployment workflows.