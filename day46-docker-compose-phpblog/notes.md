# Notes – Day 46: Deploying a PHP Blog with Docker Compose

This document provides a detailed walkthrough of the steps taken to accomplish the task of deploying a PHP blog application with a MySQL backend using Docker Compose.

## Prerequisites

Before you begin, ensure you have the following installed on your system:

- **Docker**: A containerization platform for building and running applications.
- **Docker Compose**: A tool for defining and running multi-container Docker applications.

## Why Docker Compose?

Docker Compose is a powerful tool that simplifies the management of multi-container Docker applications. Here are some of the key benefits:

- **Simplified Orchestration**: Define and manage a complete application stack (e.g., web server, database, etc.) in a single YAML file.
- **Improved Developer Productivity**: Spin up a full development environment with a single command, eliminating the need for complex setup scripts.
- **Consistency Across Environments**: Ensure that your application runs the same way in development, testing, and production by using the same `docker-compose.yml` file.
- **Reproducibility**: Easily replicate your application stack on any machine with Docker and Docker Compose installed.

## Commands Used

The following commands were used to deploy the PHP blog application:

```bash
# Create a directory to store the Docker Compose file
sudo mkdir -p /opt/dba

# Create and edit the Docker Compose file
sudo vi /opt/dba/docker-compose.yml

# Navigate to the directory containing the Docker Compose file
cd /opt/dba

# Start the application in detached mode
sudo docker compose up -d

# Verify that the containers are running
sudo docker ps

# Test the web application by sending a request to the specified port
curl http://localhost:5002/
```

## Lessons Learned

This task provided several valuable insights into working with Docker Compose:

- **Volumes for Data Persistence**: The use of `volumes` in the `docker-compose.yml` file ensures that data is persisted even if the containers are removed or recreated. This is crucial for stateful applications like databases.
- **Environment Variables for Configuration**: Environment variables are a convenient way to pass configuration information to containers without having to hardcode it into the Docker image. In this task, they were used to configure the MariaDB database.
- **Port Mapping for External Access**: Mapping a host port to a container port (e.g., `5002:80`) exposes the application to the outside world, allowing users to access it through their web browser.

## Troubleshooting

Here are some common issues you might encounter and how to resolve them:

- **Port Conflict**: If you get an error message indicating that the port is already in use, it means that another application is listening on the same port. To resolve this, you can either stop the other application or change the port mapping in the `docker-compose.yml` file.
- **Container Not Starting**: If a container fails to start, you can view the logs to get more information about the error. Use the `sudo docker compose logs <service_name>` command to view the logs for a specific service.
- **"docker compose: command not found"**: If you get this error, it means that Docker Compose is not installed or not in your system's PATH. Please refer to the official Docker documentation for instructions on how to install Docker Compose.