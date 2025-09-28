# Day 51 – Rolling Update of Nginx Deployment (xFusionCorp)

## 🔧 Task

The Nautilus application development team introduced new changes to their nginx web server.  
We need to roll out an update of the existing deployment to use the new image `nginx:1.19`.

**Requirements:**

- Deployment name: `nginx-deployment`
- New image: `nginx:1.19`
- Perform a rolling update without downtime.
- Verify that all pods are running with the new image.

## 🖥️ Target Cluster

- Tool: kubectl (already configured on jump_host)
- Namespace: default (unless otherwise stated)

## 📌 Notes

Container name inside the deployment is **`nginx-container`**, not `nginx`.  
Use the correct container name when updating the image.
