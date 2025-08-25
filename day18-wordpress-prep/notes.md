# Day 18: WordPress Prerequisites Installation

This document outlines the steps taken to prepare the application servers in Stratos DC for a new WordPress deployment for xFusionCorp Industries.

## Task

The primary goal was to install necessary PHP packages, deploy the WordPress files, configure the database connection, and set the correct file permissions for the web root.

## Script Breakdown

The `setup_wordpress_prep.sh` script automates the entire process. Here’s a breakdown of the commands used:

### 1. Install Required Packages

First, we install the necessary PHP packages (`php`, `php-mysql`, and `php-gd`) using `yum`. The `-y` flag automatically answers "yes" to any prompts.

```bash
yum install -y php php-mysql php-gd
```

### 2. Unzip and Deploy WordPress Files

The WordPress archive is unzipped from `/tmp`, and its contents are copied to the web root directory `/var/www/html/`.

```bash
unzip /tmp/beta-wordpress.zip -d /tmp
cp -r /tmp/wordpress/* /var/www/html/
```

### 3. Configure WordPress

A `wp-config.php` file is created by copying the sample configuration. Then, `sed` is used to replace the placeholder database credentials with the production database details.

```bash
# Create wp-config.php from sample
cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

# Update database details in wp-config.php
sed -i 's/database_name_here/kodekloud_db9/' /var/www/html/wp-config.php
sed -i 's/username_here/kodekloud_user9/' /var/www/html/wp-config.php
sed -i 's/password_here/kodekloud_pasw9/' /var/www/html/wp-config.php
sed -i 's/localhost/stdb01/' /var/www/html/wp-config.php
```

### 4. Set Ownership

Finally, the ownership of the `/var/www/html` directory and all its contents is recursively set to the `apache` user and group to ensure the web server can read and write the files.

```bash
chown -R apache:apache /var/www/html
```