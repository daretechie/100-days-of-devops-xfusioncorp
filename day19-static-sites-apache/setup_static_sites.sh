#!/bin/bash
# Day 19 Task 19 - Static Websites Setup on Apache (App Server 2)

# Install Apache
sudo yum install -y httpd

# Change Apache listen port to 3000
sudo sed -i 's/^Listen 80/Listen 3000/' /etc/httpd/conf/httpd.conf

# Copy website files from jump host (assuming copied manually first)
sudo mkdir -p /var/www/html/official /var/www/html/games
sudo cp -r /home/thor/official/* /var/www/html/official/
sudo cp -r /home/thor/games/* /var/www/html/games/

# Set permissions
sudo chown -R apache:apache /var/www/html/official /var/www/html/games

# Restart Apache
sudo systemctl enable httpd
sudo systemctl restart httpd

# Test websites
curl http://localhost:3000/official/
curl http://localhost:3000/games/