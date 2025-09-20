# Day 44 – Host Static Website via httpd Container using Docker Compose (xFusionCorp)

## 🔧 Task

The Nautilus application development team shared static website content that needs to be hosted on the httpd web server using a containerised platform.

**Requirements:**

- Server: App Server 3
- Create a container named **httpd** using a Docker Compose file at `/opt/docker/docker-compose.yml`.
- Use **httpd (latest)** image.
- Map container port **80** to host port **8083**.
- Mount `/opt/sysops` on host to `/usr/local/apache2/htdocs` inside the container.

## 🖥️ Target Server

- **Hostname:** stapp03.stratos.xfusioncorp.com
- **IP:** 172.16.238.12
- **User:** banner
- **Password:** BigGr33n

## 📌 Notes

- Do **not** modify any data in `/opt/sysops`.
- Container must be named **httpd**.
