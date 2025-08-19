#!/bin/bash
# Day 12 Task 12 - Fix Apache Port 5003 Connectivity Issue

# Step 1: Restart Apache (in case it’s stopped)
echo "[INFO] Restarting Apache service..."
sudo systemctl restart httpd || echo "[WARN] Apache failed to restart, check logs"

# Step 2: Ensure Apache is listening on port 5003
echo "[INFO] Checking listening ports..."
sudo netstat -tulnp | grep httpd || echo "[ERROR] Apache not listening"

# Step 3: Insert firewall (iptables) rule to allow port 5003
echo "[INFO] Adding iptables rule for port 5003..."
sudo iptables -I INPUT -p tcp --dport 5003 -j ACCEPT

# Step 4: Save iptables rules (persistent after reboot)
echo "[INFO] Saving iptables rules..."
sudo iptables-save | sudo tee /etc/sysconfig/iptables

# Step 5: Confirm accessibility from localhost
echo "[INFO] Testing locally..."
curl -s http://localhost:5003 >/dev/null && echo "[SUCCESS] Apache is running locally" || echo "[FAIL] Apache not reachable locally"

echo "[DONE] Task completed. Now test from jump host: curl http://stapp01:5003"