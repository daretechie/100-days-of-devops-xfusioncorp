#!/bin/bash

# Day 6 - Install Cronie and setup root cron job

# Install cronie
echo "[INFO] Installing cronie..."
sudo yum install -y cronie

# Enable and start crond service
echo "[INFO] Enabling and starting crond..."
sudo systemctl enable crond
sudo systemctl start crond

# Add cron job for root
CRON_JOB="*/5 * * * * echo hello > /tmp/cron_text"
echo "[INFO] Adding cron job for root..."
( sudo crontab -l 2>/dev/null; echo "$CRON_JOB" ) | sudo crontab -

# Verify
echo "[INFO] Current root crontab:"
sudo crontab -l
