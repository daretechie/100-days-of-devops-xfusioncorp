#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e
set -o pipefail

# This script secures the server by configuring iptables to only allow
# specific incoming traffic.

# --- Configuration ---
# The port Apache is running on.
APACHE_PORT=6400
# The IP address of the Load Balancer (LBR).
# IMPORTANT: Replace with the actual LBR IP address.
LBR_HOST_IP="172.16.238.14"
# The port for SSH access.
SSH_PORT=22

echo "[INFO] Starting firewall configuration..."

# Step 1: Install iptables-services
# This package provides the service to manage and persist iptables rules.
echo "[INFO] Installing iptables-services..."
sudo yum install -y iptables-services
if [ $? -ne 0 ]; then
    echo "[ERROR] Failed to install iptables-services. Aborting."
    exit 1
fi

# Step 2: Flush all current rules to start with a clean slate
echo "[INFO] Flushing existing iptables rules..."
sudo iptables -F
sudo iptables -X
sudo iptables -Z

# Step 3: Set default policies to DROP all incoming traffic
# This is a security best practice. If a packet doesn't match a rule, it's dropped.
echo "[INFO] Setting default INPUT policy to DROP..."
sudo iptables -P INPUT DROP
sudo iptables -P FORWARD DROP
sudo iptables -P OUTPUT ACCEPT # Allow all outgoing traffic

# Step 4: Add rules for essential traffic
echo "[INFO] Adding essential firewall rules..."

# Allow traffic on the loopback interface (required for many services)
sudo iptables -A INPUT -i lo -j ACCEPT

# Allow returning traffic for established connections
sudo iptables -A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT

# Allow SSH access from any source to avoid getting locked out
sudo iptables -A INPUT -p tcp --dport ${SSH_PORT} -j ACCEPT
echo "[INFO] Rule added for SSH on port ${SSH_PORT}."

# Step 5: Add the application-specific rule
# Allow traffic on the Apache port ONLY from the LBR host.
echo "[INFO] Adding rule for Apache on port ${APACHE_PORT} from LBR host (${LBR_HOST_IP})..."
sudo iptables -A INPUT -p tcp -s ${LBR_HOST_IP} --dport ${APACHE_PORT} -j ACCEPT

# Step 6: Save the rules and start the service
echo "[INFO] Saving iptables rules to make them persistent..."
sudo service iptables save

echo "[INFO] Enabling and starting the iptables service..."
sudo systemctl enable iptables
sudo systemctl start iptables

echo "[SUCCESS] Firewall has been configured and is active."
echo "[INFO] Current iptables rules:"
sudo iptables -L -n -v