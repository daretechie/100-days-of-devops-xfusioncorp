#!/bin/bash
# Day 48 Task 48 – Create Nginx Pod on Kubernetes Cluster

# Exit immediately if a command exits with a non-zero status
set -e

# Create YAML manifest on the fly
cat <<'EOF' > pod-nginx.yaml
apiVersion: v1
kind: Pod
metadata:
  name: pod-nginx
  labels:
    app: nginx_app
spec:
  containers:
  - name: nginx-container
    image: nginx:latest
EOF