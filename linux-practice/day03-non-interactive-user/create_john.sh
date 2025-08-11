#!/bin/bash

# Day 3 - Create a non-interactive user for backup agent

USERNAME="john"
SHELL="/usr/sbin/nologin"

# Create the user with a non-interactive shell
sudo useradd -s "$SHELL" "$USERNAME"

# Confirm user creation
id "$USERNAME"
getent passwd "$USERNAME"
