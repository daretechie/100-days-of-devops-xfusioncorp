# Day 51: Kubernetes Rolling Update

This document outlines the process for performing a rolling update on a Kubernetes deployment. 

## Understanding Rolling Updates

A rolling update is a deployment strategy that incrementally replaces old versions of an application with new ones. This process ensures that the application remains available throughout the update, minimizing downtime. Kubernetes achieves this by systematically replacing pods running the old version of the application with pods running the new version.

## Steps to Perform a Rolling Update

### 1. Inspect the Existing Deployment

First, it's essential to check the current status of the deployment to understand its state before making any changes.

```bash
kubectl get deployment nginx-deployment
kubectl describe deployment nginx-deployment
```

### 2. Trigger the Rolling Update

To initiate the rolling update, use the `kubectl set image` command. This command updates the container image of the deployment, which triggers the rollout.

- **Deployment:** `nginx-deployment`
- **Container:** `nginx-container`
- **New Image:** `nginx:1.19`

```bash
kubectl set image deployment/nginx-deployment nginx-container=nginx:1.19 --record
```
The `--record` flag is used to record the command in the deployment's revision history, which is useful for rollbacks.

### 3. Monitor the Rollout Status

You can monitor the progress of the rolling update in real-time.

```bash
kubectl rollout status deployment/nginx-deployment
```

### 4. Verify the Update

After the rollout is complete, verify that the deployment has been updated successfully and that the new pods are running the correct image version.

```bash
kubectl get pods -l app=nginx -o jsonpath='{range .items[*]}{.spec.containers[0].image}{"\n"}{end}'
```

This command will list the images of all containers in the pods managed by the deployment, allowing you to confirm that `nginx:1.19` is now in use.

### (Optional) Rollback the Update

If something goes wrong, you can easily roll back to the previous version.

```bash
# Check revision history
kubectl rollout history deployment/nginx-deployment

# Rollback to the previous version
kubectl rollout undo deployment/nginx-deployment
```