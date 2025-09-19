# Notes – Day 43: Deploy Nginx Container

## 🔍 Overview

Nginx Alpine with Perl provides a lightweight web server container solution, optimized for production deployments with minimal footprint.

## 🎯 Task Goals

1. Pull specific Nginx image (`nginx:alpine-perl`)
2. Deploy container with port mapping
3. Verify web server functionality

## 🛠️ Implementation

### 1. Pull Nginx Image

```bash
# Pull lightweight Nginx image with Perl support
sudo docker pull nginx:alpine-perl
```

### 2. Deploy Container

```bash
# Run Nginx container with port mapping
sudo docker run -d \
  --name beta \
  -p 3000:80 \
  nginx:alpine-perl
```

### 3. Verify Deployment

```bash
# Check container status
sudo docker ps

# Test web access
curl localhost:3000
```

## 📝 Key Concepts

### Container Configuration

- `nginx:alpine-perl`: Lightweight image (~80MB vs ~140MB regular)
- `-d`: Run in detached mode (background)
- `--name beta`: Assign container name
- `-p 3000:80`: Map host port 3000 to container port 80

### Common Operations

```bash
# View container logs
sudo docker logs beta

# Enter container shell
sudo docker exec -it beta sh

# Stop container
sudo docker stop beta

# Remove container
sudo docker rm beta
```

## 🔍 Troubleshooting

### Container Issues

```bash
# Check container health
sudo docker inspect beta | grep Status

# View Nginx logs
sudo docker exec beta cat /var/log/nginx/access.log
sudo docker exec beta cat /var/log/nginx/error.log
```

### Web Server Issues

```bash
# Test Nginx configuration
sudo docker exec beta nginx -t

# Check running processes
sudo docker top beta
```

## 💡 Best Practices

1. Container Management

   - Use meaningful container names
   - Always specify image versions
   - Monitor container resources

2. Security
   - Avoid exposing unnecessary ports
   - Use non-root user in container
   - Keep base image updated

## 🧪 Testing

1. Basic Connectivity

   ```bash
   curl -I localhost:3000
   ```

2. Container Health
   ```bash
   docker stats beta
   ```

## 📚 References

- [Nginx Docker Hub](https://hub.docker.com/_/nginx)
- [Alpine Linux](https://alpinelinux.org/)
- [Docker Run Reference](https://docs.docker.com/engine/reference/run/)
