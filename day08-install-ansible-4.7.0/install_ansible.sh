#!/bin/bash

# Day 8 - Install Ansible 4.7.0 on Jump Host using pip3

# Ensure pip3 is installed
echo "[INFO] Installing pip3 if missing..."
sudo yum install -y python3-pip

# Install Ansible 4.7.0 globally
echo "[INFO] Installing Ansible 4.7.0 via pip3..."
sudo pip3 install ansible==4.7.0

# Verify installation
echo "[INFO] Verifying Ansible version..."
ansible --version

# Check binary location to ensure it's globally accessible
echo "[INFO] Ansible binary location:"
which ansible
