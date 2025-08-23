#!/bin/bash
# Day 15 Task 15 - Install and configure nginx with SSL on App Server 2

# Install nginx
sudo yum install -y nginx

# Enable and start nginx
sudo systemctl enable nginx
sudo systemctl start nginx

# Create ssl directory and move certificates
sudo mkdir -p /etc/nginx/ssl
sudo mv /tmp/nautilus.crt /etc/nginx/ssl/nautilus.crt
sudo mv /tmp/nautilus.key /etc/nginx/ssl/nautilus.key
sudo chmod 600 /etc/nginx/ssl/nautilus.*

# Configure nginx SSL
NGINX_CONF="/etc/nginx/conf.d/ssl.conf"
sudo bash -c "cat > $NGINX_CONF" <<EOL
server {
    listen 443 ssl;
    server_name _;

    ssl_certificate     /etc/nginx/ssl/nautilus.crt;
    ssl_certificate_key /etc/nginx/ssl/nautilus.key;

    root /usr/share/nginx/html;
    index index.html;
}
EOL

# Create index.html
echo "Welcome!" | sudo tee /usr/share/nginx/html/index.html

# Restart nginx
sudo systemctl restart nginx

# Verify nginx is running
sudo systemctl status nginx --no-pager
