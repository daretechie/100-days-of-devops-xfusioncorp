#!/bin/bash


# Day 2 - Group Based Access Control Setup
# Note: We have to run the code on each server

GROUP="nautilus_noc"
USER="jarod"

# Create group if it doesn't exist
if ! getent group $GROUP > /dev/null; then
  sudo groupadd "$GROUP"
  echo "Group $GROUP created."
else
  echo "Group $GROUP already exists."
fi

# Create user if it doesn't exist
if ! id "$USER" &>/dev/null; then
  sudo useradd -m "$USER"
  echo "User $USER created."
else
  echo "User $USER already exists."
fi

# Add user to the group
sudo usermod -aG "$GROUP" "$USER"
echo "User $USER added to group $GROUP."

# Verify
id "$USER"