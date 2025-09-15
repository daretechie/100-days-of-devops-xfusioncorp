# Day 39 – Create Docker Image from Existing Container (xFusionCorp)

## 🔧 Task

A Nautilus developer has been testing new changes on a container and wants to keep a backup.  
On **Application Server 2** in Stratos Datacenter:

- Create a new image named `games:datacenter` from an existing container called `ubuntu_latest` that is running on the same server.

## 🖥️ Target Server

- Hostname: stapp02.stratos.xfusioncorp.com
- IP: 172.16.238.11
- User: banner
- Password: BigGr33n

## 📌 Notes

The container `ubuntu_latest` already exists and is running.  
We must commit it to an image with the tag `games:datacenter` without stopping it.
The new image should be verified by listing all Docker images on the server.
