# Day 36: Deploying an Nginx Container

## Task Overview

The objective for Day 36 was to deploy a containerized Nginx application on App Server 1. This task is a fundamental step in containerization, demonstrating the ability to quickly and reliably deploy web servers.

**Key Requirements:**

- **Server:** App Server 1
- **Container Name:** `nginx_1`
- **Image:** `nginx:alpine`
- **State:** Running

## Execution and Commands

The deployment was accomplished using a simple shell script (`deploy_nginx.sh`). The core command used is:

```bash
# Run the Nginx container in detached mode
sudo docker run -d --name nginx_1 nginx:alpine
```

- `sudo`: Executes the command with root privileges, necessary for Docker operations.
- `docker run`: The command to create and run a new container.
- `-d`: Runs the container in detached mode (in the background).
- `--name nginx_1`: Assigns a specific name to the container for easy reference.
- `nginx:alpine`: Specifies the Docker image to use. The `alpine` tag indicates a lightweight version of the Nginx image.

## Verification

To confirm the container was running successfully, the following command was used:

```bash
# List running containers, filtered by name
sudo docker ps --filter "name=nginx_1"
```

The output of this command verifies:

- **Container Name:** `nginx_1`
- **Image:** `nginx:alpine`
- **Status:** `Up` (indicating the container is running)

## Lessons Learned and Best Practices

- **Use Specific Image Tags:** Using `nginx:alpine` instead of just `nginx` is a best practice. Alpine-based images are significantly smaller, leading to faster downloads and a reduced attack surface.
- **Name Your Containers:** Always use the `--name` flag to assign a meaningful name to your containers. This makes them easier to manage (start, stop, inspect, etc.) than relying on the auto-generated container IDs.
- **Detached Mode for Services:** Running containers in detached mode (`-d`) is standard practice for long-running services like web servers.
- **Verification is Key:** Always verify the state of your containers after creating or modifying them. `docker ps` is the primary tool for this.

This task serves as a foundational exercise in working with Docker, covering the essential commands for deploying and verifying a containerized application. It highlights the importance of naming containers, using specific image tags, and running containers in detached mode.
