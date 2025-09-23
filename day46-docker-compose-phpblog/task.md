# Day 46 – Deploy PHP Blog + MariaDB Stack using Docker Compose (xFusionCorp)

## 🔧 Task

The Nautilus Application Development team wants to test their PHP Blog application with a MariaDB backend using Docker Compose on App Server 2.

**Requirements:**

### Web Service

- Container name: `php_blog`
- Image: `php:<apache-tag>` (e.g. `php:apache` or `php:8.2-apache`)
- Host port `5002` → container port `80`
- Volume: host `/var/www/html` → container `/var/www/html`

### DB Service

- Container name: `mysql_blog`
- Image: `mariadb:latest`
- Host port `3306` → container port `3306`
- Volume: host `/var/lib/mysql` → container `/var/lib/mysql`
- Environment variables:
  - `MYSQL_DATABASE=database_blog`
  - Non-root custom user and complex password

## 🖥️ Target Server

- Hostname: `stapp02.stratos.xfusioncorp.com`
- IP: `172.16.238.11`
- User: `banner`
- Password: `BigGr33n`

## 📌 Notes

After `docker-compose up -d` you should be able to hit the PHP Blog app at:  
`curl http://<server-ip>:5002/`
