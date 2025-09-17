# Day 41 – Build Custom Apache Image (xFusionCorp)

## 🔧 Task

The Nautilus DevOps team needs a custom Docker image:

- Base image: `ubuntu:24.04`
- Install `apache2`
- Configure Apache to work on port `3003` (don’t change DocumentRoot or other defaults)

## 🖥️ Target Server

- Hostname: stapp03.stratos.xfusioncorp.com
- IP: 172.16.238.13
- User: banner
- Password: BigGr33n

## 📌 Notes

Create `/opt/docker/Dockerfile` with a **capital D**.
