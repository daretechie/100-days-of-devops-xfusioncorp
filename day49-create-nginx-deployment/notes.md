# Notes – Day 49 Task 49: Create Nginx Deployment

## Task

The Nautilus DevOps team is delving into Kubernetes app management.

Create a **Deployment** with the following specs:

- **Deployment Name:** `nginx`
- **Image:** `nginx:latest` (tag must be specified)

## 📝 Deployment Definition (nginx-deployment.yaml)

To create the deployment, we use a YAML manifest file. This file declaratively defines the desired state of the deployment.

```yaml
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
```

### 🔍 Why Use a Deployment Instead of a Pod?

- **Self-healing:** If a Pod crashes, the Deployment Controller will automatically replace it.
- **Scalability:** You can easily scale the number of Pods up or down by changing the `replicas` field.
- **Rolling Updates:** Deployments allow you to update your application with zero downtime. The Deployment Controller will incrementally update Pods with the new version of your application.
- **Declarative Updates:** You can update the desired state of your application by modifying the Deployment manifest and applying it.

## ✅ Commands Used

Here are the commands used to create and verify the deployment:

```bash
# Create the deployment from the YAML manifest
kubectl apply -f nginx-deployment.yaml

# --- OR --- #

# Create the deployment using an imperative command
kubectl create deployment nginx --image=nginx:latest

# Verify that the deployment was created successfully
kubectl get deployments

# Check the status of the pods created by the deployment
kubectl get pods

# Verify that the pods have the correct label
kubectl get pods -l app=nginx
```

## 💡 Lessons Learned

- **`apiVersion: apps/v1`**:  Specifies the version of the Kubernetes API to use for Deployments.
- **`kind: Deployment`**:  Specifies the type of Kubernetes object to create.
- **`spec.replicas`**:  The number of Pods that the Deployment should maintain.
- **`spec.selector`**:  A set of labels that the Deployment uses to identify the Pods it manages.
- **`spec.template`**:  A template for the Pods that the Deployment will create. It contains the `metadata` (including labels) and `spec` for the Pods.
- **Imperative vs. Declarative:** While `kubectl create deployment` is a quick way to create a deployment, using a YAML manifest (`kubectl apply -f ...`) is the recommended best practice. Manifests can be version-controlled, reviewed, and reused, which is essential for managing infrastructure as code.