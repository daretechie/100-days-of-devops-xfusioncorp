#!/bin/bash
# Day 49 Task 49 – Create Nginx Deployment on Kubernetes Cluster

set -e

# Create YAML manifest on the fly
cat <<'EOF' > nginx-deployment.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx
spec:
  replicas: 1
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:latest
EOF