# Day 45 – Fix Broken Dockerfile and Build Image (xFusionCorp)

## 🔧 Task

The Nautilus DevOps team needs a working Docker image built from a Dockerfile under `/opt/docker` on App Server 3.

**Requirements:**

- Dockerfile location: `/opt/docker/Dockerfile`.
- Fix any syntax/command issues so that the image builds successfully.
- Do not change:
  - Base image.
  - Any valid configuration within Dockerfile.
  - Any data like `index.html`.

## 🖥️ Target Server

- **Hostname:** stapp03.stratos.xfusioncorp.com
- **IP:** 172.16.238.12
- **User:** banner
- **Password:** BigGr33n

## 📌 Notes

Once finished, all existing containers will be destroyed and the new image will be built automatically by the lab.
