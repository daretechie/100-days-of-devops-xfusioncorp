#!/bin/bash


# Day 3 - Disable direct root SSH login
# This script should be run on each app server.

CONFIG_FILE="/etc/ssh/sshd_config"

# Backup config before changes
sudo cp "CONFIG_FILE" "${CONFIG_FILE}.bak".$(date +%F-%T)

# Disable root login
sudo sed -i 's/^#\?mitRootLogin.*/PermitRootLogin no/' "${CONFIG_FILE}"

# Restart SSH service
if command -v systemctl &> /dev/null; then
    sudo systemctl restart sshd
else
    sudo service sshd restart
fi

# Verify change
grep "^PermitRootLogin" "$CONFIG_FILE"