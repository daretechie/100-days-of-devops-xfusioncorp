#!/bin/bash
# Day 21 Task 21 - Setup Bare Git Repository

# Install git if not installed
sudo yum install -y git

# Create bare repository at /opt/media.git
sudo git init --bare /opt/media.git

# Verify repository creation
if [ -d "/opt/media.git" ]; then
  echo "Bare repository /opt/media.git created successfully."
else
  echo "Failed to create repository."
  exit 1
fi