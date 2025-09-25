# Notes – Day 48 Task 48: Create Nginx Pod

## Task

The Nautilus DevOps team is diving into Kubernetes. We need to create a pod with the following specs:

- **Pod Name:** `pod-nginx`
- **Image:** `nginx:latest` (tag must be specified)
- **Container Name:** `nginx-container`
- **Label:** `app=nginx_app`

## 📝 Pod Definition (pod-nginx.yaml)

To create the pod, we can use a YAML manifest file. This file declaratively defines the desired state of the pod.

```yaml
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
```

### 🔍 Why Use a Manifest?

- **Declarative:** You define *what* you want, and Kubernetes figures out *how* to achieve it.
- **Version Control:** You can store your infrastructure as code in Git, track changes, and collaborate with your team.
- **Consistency:** Ensures that you deploy the same configuration every time, across different environments.
- **Reusability:** You can easily reuse and adapt the manifest for other deployments.

## ✅ Commands Used

Here are the commands used to create and verify the pod:

```bash
# Create the pod from the YAML manifest
kubectl apply -f pod-nginx.yaml

# Verify that the pod was created successfully
kubectl get pods

# Get more details about the pod, including its labels
kubectl describe pod pod-nginx

# Another way to verify the labels
kubectl get pod pod-nginx --show-labels
```

## 💡 Lessons Learned

- **`apiVersion: v1`**:  Specifies the version of the Kubernetes API to use. For pods, it's `v1`.
- **`kind: Pod`**:  Specifies the type of Kubernetes object to create.
- **`metadata`**:  Contains data that helps uniquely identify the object, including its `name` and `labels`.
- **`spec`**:  Defines the desired state for the object. For a pod, this includes the `containers` that should run inside it.
- **`spec.containers`**:  A list of containers to run in the pod. Each container has a `name` and the `image` to use.
- **Image Tag:** It's a best practice to always specify an image tag (e.g., `nginx:latest` or a specific version like `nginx:1.21.6`) rather than just the image name. This ensures that you are using a specific version of the image and avoids unexpected updates.
- **Labels:** Labels are key/value pairs that are attached to objects. They are used to organize and to select subsets of objects. In this case, the label `app=nginx_app` can be used to identify all the pods that belong to the `nginx_app` application.