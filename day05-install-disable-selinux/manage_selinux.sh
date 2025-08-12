#!/bin/bash

# Day 5 - Install SELinux packages & permanently disable it

# Install SELinux packages
echo "[INFO] Installing SELinux packages..."
sudo yum install -y selinux-policy selinux-policy-targeted policycoreutils

# Permanently disable SELinux
echo "[INFO] Disabling SELinux permanently..."
sudo sed -i 's/^SELINUX=.*/SELINUX=disabled/' /etc/selinux/config

# Display current config setting
echo "[INFO] SELinux config file updated:"
grep SELINUX= /etc/selinux/config

echo "[INFO] No reboot performed. Status will be disabled after reboot."
