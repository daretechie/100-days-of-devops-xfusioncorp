# Notes – Day 42: Create Custom Docker Network

## 🔍 Overview

Docker networks enable isolated container communication with custom IP ranges. The bridge network driver provides network isolation at the host level.

## 🎯 Task Goal

Create a custom bridge network named `beta` with specific subnet configuration for Project Nautilus containers.

## 🛠️ Implementation

### 1. Create Network

```bash
# Create custom bridge network with specified subnet
sudo docker network create \
  --driver bridge \
  --subnet 172.28.0.0/24 \
  --ip-range 172.28.0.0/24 \
  beta
```

### 2. Verify Network

```bash
# List networks
sudo docker network ls | grep beta

# Inspect network details
sudo docker network inspect beta
```

## 📝 Key Concepts

### Network Flags

- `--driver bridge`: Creates isolated network segment
- `--subnet`: Defines entire network address range
- `--ip-range`: Specifies assignable IP addresses
- Network name: `beta` (used in container run commands)

### Common Operations

```bash
# Connect container to network
sudo docker run --network beta nginx

# Disconnect container from network
sudo docker network disconnect beta container_name

# Remove network
sudo docker network rm beta
```

## 💡 Best Practices

1. Use meaningful network names
2. Document subnet ranges
3. Verify network isolation
4. Clean up unused networks

## 🔍 Troubleshooting

- Check network exists: `docker network ls`
- Verify connectivity: `docker exec container_name ping other_container`
- Review logs: `docker logs container_name`

## 📚 References

- [Docker Network Documentation](https://docs.docker.com/network/)
- [Bridge Network Driver](https://docs.docker.com/network/bridge/)
