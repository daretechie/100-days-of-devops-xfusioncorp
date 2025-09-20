# Day 44: HTTPD Docker Compose

This document provides a detailed explanation of the `docker-compose.yml` file used to deploy an `httpd` (Apache) web server.

## Introduction to Docker Compose

Docker Compose is a tool for defining and running multi-container Docker applications. It uses a YAML file to configure the application's services, networks, and volumes. With a single command, you can create and start all the services from your configuration.

## Task

The task was to create a `docker-compose.yml` file to deploy an `httpd` container. The requirements for the container were:

-   Use the `httpd:latest` image.
-   Map port 80 on the host to port 80 in the container.
-   Name the container `httpd_container`.

## `docker-compose.yml` Explained

The `docker-compose.yml` file is structured as follows:

```yaml
version: '3.8'

services:
  web:
    image: httpd:latest
    ports:
      - "80:80"
    container_name: httpd_container
```

### Top-level keys

-   `version: '3.8'`: This specifies the version of the Docker Compose file format. Version `3.8` is a recent and recommended version.

### `services`

The `services` key defines the different containers that make up the application. In this case, we only have one service, which we've named `web`.

### `web` service

-   `image: httpd:latest`: This specifies the Docker image to use for the service. We are using the latest version of the official `httpd` image from Docker Hub.
-   `ports: - "80:80"`: This maps port 80 on the host machine to port 80 in the container. This allows us to access the Apache server from our local machine by navigating to `http://localhost`.
-   `container_name: httpd_container`: This sets a custom name for the container. If this is not specified, Docker Compose will generate a name based on the project name and service name.

## Usage

To use this `docker-compose.yml` file, you can run the following commands in the same directory as the file:

-   `docker-compose up`: This command will create and start the `httpd_container`. You can add the `-d` flag to run the container in detached mode (in the background).
-   `docker-compose down`: This command will stop and remove the container, network, and volumes created by `docker-compose up`.

## Conclusion

Using Docker Compose simplifies the process of deploying and managing Docker containers. It allows us to define our application stack in a single file and manage it with simple commands. This is particularly useful for complex applications with multiple services, but it is also beneficial for single-service applications like this one, as it provides a clear and reproducible way to define the container's configuration.