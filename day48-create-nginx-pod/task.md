# Day 48 – Create Nginx Pod on Kubernetes Cluster

## 🔧 Task

The Nautilus DevOps team is diving into Kubernetes.  
We need to create a pod with the following specs:

- **Pod Name:** `pod-nginx`
- **Image:** `nginx:latest` (tag must be specified)
- **Container Name:** `nginx-container`
- **Label:** `app=nginx_app`

## 🖥️ Target Environment

- **Kubernetes Cluster:** already configured for `kubectl` on jump_host.

## 📌 Notes

This pod should be created using `kubectl` commands or a YAML manifest and must be reproducible via a script for automation.
