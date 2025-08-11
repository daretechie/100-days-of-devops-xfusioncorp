#!/bin/bash

# Day 1 - Create custom Apache user

# Variables
USERNAME="mariyam"
USER_ID="1631"
HOMEDIR="/var/www/mariyam"

# Create user with specific UID and home directory
# What this does:
#   -u → sets UID
#   -d → sets custom home directory
#   -m → creates the home directory
sudo useradd -u "$USER_ID" -d "$HOMEDIR" -m "$USERNAME"

# Verify user was created
id "$USERNAME"
ls -ld "$HOMEDIR"


# Optional: Set a password if required
# echo "mariyam:StrongPasswordHere" | sudo chpasswd