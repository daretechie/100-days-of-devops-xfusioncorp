#!/bin/bash

# Day 4 - Make /tmp/xfusioncorp.sh executable by everyone

SCRIPT_PATH="/tmp/xfusioncorp.sh"

# Check if file exists
if [ ! -f "$SCRIPT_PATH" ]; then
    echo "Error: $SCRIPT_PATH not found."
    exit 1
fi

# Add execute permissions for all users
sudo chmod a+x "$SCRIPT_PATH"

# Verify permissions
ls -l "$SCRIPT_PATH"
