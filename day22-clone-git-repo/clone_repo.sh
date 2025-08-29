#!/bin/bash
# Day 22 Task 22 - Clone Git repo on Storage Server

# Variables
SRC_REPO="/opt/news.git"
DEST_DIR="/usr/src/kodekloudrepos"

# Ensure destination exists
sudo mkdir -p "$DEST_DIR"

# Clone the repository
sudo git clone "$SRC_REPO" "$DEST_DIR"

# Verify repository clone
ls -la "$DEST_DIR"