# Day 52 – Rollback Nginx Deployment (xFusionCorp)

## 🔧 Task

The Nautilus DevOps team deployed a new release of the nginx application.  
A bug has been reported, and we need to rollback the deployment to the **previous revision**.

**Requirements:**

- Deployment name: `nginx-deployment`
- Use `kubectl rollout undo` to rollback to the previous revision.
- Verify rollback success and pods status.

## 🖥️ Target Cluster

- Tool: kubectl (already configured on jump_host)
- Namespace: default (unless otherwise specified)

## 📌 Notes

The rollback reverts to the last successful state (previous image version).
