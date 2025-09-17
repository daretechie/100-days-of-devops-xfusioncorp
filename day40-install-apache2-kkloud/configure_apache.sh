#!/bin/bash
# Day 40 Task – Install & Configure Apache2 on kkloud container (App Server 3)

CONTAINER="kkloud"

# 1. Install apache2 inside the container
docker exec -it $CONTAINER bash -c "apt-get update && apt-get install -y apache2"

# 2. Configure Apache to listen on port 5004
docker exec -it $CONTAINER bash -c "sed -i 's/^Listen .*/Listen 5004/' /etc/apache2/ports.conf"
docker exec -it $CONTAINER bash -c "sed -i 's/<VirtualHost \*:.*>/<VirtualHost *:5004>/' /etc/apache2/sites-available/000-default.conf"

# 3. Test config and restart apache
docker exec -it $CONTAINER bash -c "apache2ctl configtest"
docker exec -it $CONTAINER bash -c "service apache2 restart"

# 4. Verify
docker exec -it $CONTAINER bash -c "ss -ltnp | grep 5004"