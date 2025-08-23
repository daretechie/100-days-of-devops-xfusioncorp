#!/bin/bash
# Day 16 Task 16 - Configure Nginx Load Balancer on LBR server

# Install nginx
sudo yum install -y nginx

# Enable and start nginx
sudo systemctl enable nginx
sudo systemctl start nginx

# Backup original nginx.conf
sudo cp /etc/nginx/nginx.conf /etc/nginx/nginx.conf.bak

# Configure load balancing in nginx.conf
sudo bash -c "cat > /etc/nginx/nginx.conf" <<EOL
user  nginx;
worker_processes  auto;

error_log  /var/log/nginx/error.log;
pid        /var/run/nginx.pid;

events {
    worker_connections  1024;
}

http {
    upstream app_servers {
        server 172.16.238.10:8082;
        server 172.16.238.11:8082;
        server 172.16.238.12:8082;
    }

    server {
        listen 80;

        location / {
            proxy_pass http://app_servers;
        }
    }
}
EOL

# Restart nginx to apply changes
sudo systemctl restart nginx

# Verify nginx status
sudo systemctl status nginx --no-pager
