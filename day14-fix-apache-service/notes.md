# Day 14: Fix Apache Service Availability

## 1. Objective

The goal was to ensure the Apache (httpd) service is running on all application servers (`stapp01`, `stapp02`, `stapp03`) and configured to listen on port `8082`.

## 2. The Problem

The monitoring system detected that the Apache service was down on one of the application servers. Investigation revealed that the port `8082` was already in use by another process, which prevented Apache from starting.

## 3. The Solution

A shell script, `fix_apache.sh`, was created to automate the fix on all application servers. The script performs the following actions:

1.  **Installs Apache (`httpd`)**: Ensures Apache is installed.
2.  **Enables Apache**: Configures Apache to start on boot.
3.  **Configures Port**: Sets Apache to listen on port `8082` in `/etc/httpd/conf/httpd.conf`.
4.  **Frees Port**: Identifies and terminates any process currently using port `8082`.
5.  **Restarts Apache**: Restarts the `httpd` service to apply the changes.

### `fix_apache.sh`

```bash
#!/bin/bash
# Day 14 Task 14 - Fix Apache service and set it to port 8082

# Install Apache if not present
sudo yum install -y httpd

# Ensure httpd is enabled
sudo systemctl enable httpd

# Configure Apache to listen on port 8082
CONF_FILE="/etc/httpd/conf/httpd.conf"
if grep -q "Listen 8082" $CONF_FILE; then
  echo "Apache already configured for 8082"
else
  sudo sed -i 's/^Listen .*/Listen 8082/' $CONF_FILE
fi

# Kill any process blocking port 8082
PID=$(sudo lsof -t -i:8082 2>/dev/null)
if [ -n "$PID" ]; then
  echo "Freeing port 8082 (PID: $PID)"
  sudo kill -9 $PID
fi

# Restart Apache
sudo systemctl restart httpd

# Verify service
sudo systemctl status httpd --no-pager
sudo netstat -tulnp | grep 8082
```

## 4. Verification

After running the script on all app servers, the following commands were used to verify the fix:

- **Check Service Status**: `sudo systemctl status httpd`
- **Check Listening Port**: `sudo netstat -tulnp | grep 8082`
- **Remote Check from Jumphost**:
  ```bash
  curl http://stapp01:8082
  curl http://stapp02:8082
  curl http://stapp03:8082
  ```

All checks confirmed that the Apache service was active and listening on port `8082` across all servers.
