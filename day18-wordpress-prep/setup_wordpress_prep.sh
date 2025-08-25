#!/bin/bash
# Day 18 Task 18 - WordPress Pre-Requisites

# -------- APP SERVERS (Apache + PHP) --------
# Install Apache, PHP and dependencies
sudo yum install -y httpd php php-mysqlnd php-cli

# Update Apache to listen on port 6100
sudo sed -i 's/^Listen 80/Listen 6100/' /etc/httpd/conf/httpd.conf

# Start and enable Apache
sudo systemctl enable httpd
sudo systemctl restart httpd

# -------- DATABASE SERVER (MariaDB) --------
# Install MariaDB if not already installed
sudo yum install -y mariadb-server

# Start and enable MariaDB
sudo systemctl enable mariadb
sudo systemctl start mariadb

# Create DB and user
mysql -u root <<EOF
CREATE DATABASE kodekloud_db5;
CREATE USER 'kodekloud_gem'@'%' IDENTIFIED BY 'LQfKeWWxWD';
GRANT ALL PRIVILEGES ON kodekloud_db5.* TO 'kodekloud_gem'@'%';
FLUSH PRIVILEGES;
EOF