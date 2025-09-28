# Day 52: Kubernetes Deployment Rollback

This document provides a guide on how to roll back a Kubernetes deployment to a previous revision. This is a critical procedure for reverting a deployment that has introduced bugs or instability.

## Why Rollbacks are Important

In a production environment, it's crucial to have a quick and reliable way to revert to a stable state if a new release causes problems. Kubernetes' `rollout` mechanism provides this capability, allowing you to undo changes and restore the previous version of your application with minimal downtime.

## Steps to Roll Back a Deployment

### 1. Check the Deployment's Revision History

Before performing a rollback, it's good practice to inspect the deployment's revision history. This allows you to see the different versions that have been deployed.

```bash
kubectl rollout history deployment/nginx-deployment
```

This command will output a table with the revision numbers and the change-cause, if it was recorded (e.g., by using `--record` during the initial deployment).

### 2. Perform the Rollback

To revert to the previous revision, use the `kubectl rollout undo` command.

```bash
kubectl rollout undo deployment/nginx-deployment
```

This command tells Kubernetes to revert the deployment to the previous revision. If you need to roll back to a specific revision, you can use the `--to-revision` flag:

```bash
# Example: Rollback to revision 2
kubectl rollout undo deployment/nginx-deployment --to-revision=2
```

### 3. Monitor the Rollback Status

After initiating the rollback, you can monitor its progress in real-time.

```bash
kubectl rollout status deployment/nginx-deployment
```

### 4. Verify the Rollback

Once the rollback is complete, you should verify that the deployment is running the correct version of the application. You can do this by checking the image of the running pods.

```bash
# Check the image of the running pods
kubectl describe deployment nginx-deployment | grep -i image:

# Or, get the image from the pod template
kubectl get deployment nginx-deployment -o=jsonpath='{.spec.template.spec.containers[0].image}'
```

This confirms that the rollback was successful and the application is now running the desired version.