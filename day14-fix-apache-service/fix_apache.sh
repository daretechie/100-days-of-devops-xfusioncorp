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
