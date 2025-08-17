#!/bin/bash

# Day 2 Task 1 - Fix MariaDB Service

SERVICE="mariadb"

# Check status
sudo systemctl status $SERVICE --no-pager

# Start the service if not running
sudo systemctl start $SERVICE

# Enable on boot
sudo systemctl enable $SERVICE

# Verify it is active
sudo systemctl is-active $SERVICE
sudo ss -tulnp | grep 3306 || echo "MariaDB not listening on 3306"

# Quick log check
sudo journalctl -u $SERVICE -n 20 --no-pager

# Check for permission issues in /run/mariadb/
ls -ld /run/mariadb

# If permission issues, fix them
sudo chown -R mysql:mysql /run/mariadb

