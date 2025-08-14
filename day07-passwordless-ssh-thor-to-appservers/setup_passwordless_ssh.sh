#!/bin/bash

# Day 7 Task 7 - Setup password-less SSH from thor to all app servers
# Run this script from the jump host as thor

# App servers with respective sudo users
declare -A SERVERS=(
    ["stapp01.stratos.xfusioncorp.com"]="tony"
    ["stapp02.stratos.xfusioncorp.com"]="steve"
    ["stapp03.stratos.xfusioncorp.com"]="banner"
)

# Generate SSH key if not already present
if [ ! -f ~/.ssh/id_rsa ]; then
    echo "[INFO] Generating SSH key for thor..."
    ssh-keygen -t rsa -b 4096 -N "" -f ~/.ssh/id_rsa
fi

# Copy public key to each app server
for SERVER in "${!SERVERS[@]}"; do
    USER="${SERVERS[$SERVER]}"
    echo "[INFO] Setting up password-less SSH to $USER@$SERVER..."
    ssh-copy-id -i ~/.ssh/id_rsa.pub "$USER@$SERVER"
done

echo "[INFO] Password-less SSH setup completed."