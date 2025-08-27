#!/bin/bash
# Day 20 Task 20 - Setup Nginx + PHP-FPM on App Server 3

# Install nginx
sudo yum install -y nginx

# Install PHP 8.1 and FPM
sudo yum install -y php php-fpm php-cli

# Ensure socket directory exists
sudo mkdir -p /var/run/php-fpm

# Configure php-fpm pool to use custom socket
sudo tee /etc/php-fpm.d/www.conf > /dev/null <<EOF
[www]
user = nginx
group = nginx
listen = /var/run/php-fpm/default.sock
listen.owner = nginx
listen.group = nginx
pm = dynamic
pm.max_children = 10
pm.start_servers = 2
pm.min_spare_servers = 1
pm.max_spare_servers = 3
EOF

# Configure nginx to serve on port 8094 with PHP support
sudo tee /etc/nginx/conf.d/php_app.conf > /dev/null <<EOF
server {
    listen 8094;
    server_name stapp03;

    root /var/www/html;
    index index.php index.html;

    location / {
        try_files \$uri \$uri/ =404;
    }

    location ~ \.php\$ {
        include fastcgi_params;
        fastcgi_pass unix:/var/run/php-fpm/default.sock;
        fastcgi_index index.php;
        fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;
    }
}
EOF

# Ensure docroot exists
sudo mkdir -p /var/www/html
echo "<?php phpinfo(); ?>" | sudo tee /var/www/html/index.php

# Start services
sudo systemctl enable php-fpm nginx
sudo systemctl restart php-fpm nginx

# Test
curl -I http://localhost:8094/index.php