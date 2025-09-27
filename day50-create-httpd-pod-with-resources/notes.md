# Notes: Creating a Kubernetes Pod with Resource Requests and Limits

This document details the process of creating a Kubernetes Pod with specified resource requests and limits, as per the task for Day 50.

## 1. Task Overview

The objective was to create a Pod named `httpd-pod` running an `httpd:latest` container. The key requirement was to configure specific CPU and memory resource requests and limits to ensure predictable performance and resource management within the cluster.

## 2. Understanding Resource Management in Kubernetes

In Kubernetes, setting resource requests and limits for containers is crucial for cluster stability and application performance.

- **Requests**: This is the amount of resources that Kubernetes guarantees for a container. If a container has a request for a certain amount of CPU or memory, Kubernetes will only schedule it on a node that can provide that amount.
- **Limits**: This is the maximum amount of resources a container can use. If a container tries to exceed its memory limit, it will be terminated (OOMKilled). If it tries to exceed its CPU limit, it will be throttled.

This pod was configured with:
- **CPU Request & Limit**: `100m` (0.1 CPU core)
- **Memory Request**: `15Mi` (15 Mebibytes)
- **Memory Limit**: `20Mi` (20 Mebibytes)

## 3. Implementation

The pod was created using a YAML manifest file. A shell script was used to generate this manifest.

### `create_pod.sh`

This script generates the `httpd-pod.yaml` file.

```bash
#!/bin/bash
# Day 50 Task 50 – Create httpd Pod with Resource Requests & Limits

set -e

# Generate Pod YAML manifest
cat <<'EOF' > httpd-pod.yaml
apiVersion: v1
kind: Pod
metadata:
  name: httpd-pod
  labels:
    app: httpd
spec:
  containers:
  - name: httpd-container
    image: httpd:latest
    resources:
      requests:
        memory: "15Mi"
        cpu: "100m"
      limits:
        memory: "20Mi"
        cpu: "100m"
EOF
```

### `httpd-pod.yaml`

This is the generated Kubernetes manifest.

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: httpd-pod
  labels:
    app: httpd
spec:
  containers:
    - name: httpd-container
      image: httpd:latest
      resources:
        requests:
          memory: "15Mi"
          cpu: "100m"
        limits:
          memory: "20Mi"
          cpu: "100m"
```

## 4. Deployment and Verification

The following commands were used to deploy and verify the pod.

### Apply the Manifest

```bash
kubectl apply -f httpd-pod.yaml
```

### Verify the Pod

To verify that the pod was created with the correct resource settings, we can use `kubectl describe`.

```bash
kubectl describe pod httpd-pod
```

The output of this command should include a "Containers" section that looks like this:

```
Containers:
  httpd-container:
    Container ID:
    Image:          httpd:latest
    Image ID:
    Port:           <none>
    Host Port:      <none>
    State:          Running
      Started:      ...
    Ready:          True
    Restart Count:  0
    Limits:
      cpu:     100m
      memory:  20Mi
    Requests:
      cpu:        100m
      memory:     15Mi
    Environment:  <none>
    Mounts:       <none>
```

## 5. Key Takeaways

- **YAML quotes**: It is a good practice to quote resource values like `"15Mi"` and `"100m"` in YAML files to prevent any parsing issues.
- **Resource Units**:
    - **CPU**: `m` stands for "millicores". `1000m` is equal to 1 CPU core.
    - **Memory**: `Mi` stands for "mebibytes". This is a power-of-2 unit, where 1 Mi = 1,048,576 bytes.