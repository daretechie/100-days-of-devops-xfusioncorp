# Day 50 – Create httpd Pod with Resource Limits in Kubernetes

## 🔧 Task

Create a **Pod** with the following specs:

- **Pod Name:** `httpd-pod`
- **Container Name:** `httpd-container`
- **Image:** `httpd:latest`
- **Resource Requests:**
  - Memory: 15Mi
  - CPU: 100m
- **Resource Limits:**
  - Memory: 20Mi
  - CPU: 100m

## 🖥️ Target Environment

- **Kubernetes Cluster:** already configured for `kubectl` on jump_host.

git add day50-create-httpd-pod-with-resources
git commit -m "Day 50 Task 50: Created httpd-pod with resource requests/limits on Kubernetes cluster"
git push
