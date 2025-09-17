# Day 41: Build a Custom Apache Docker Image

## 1. Objective

The task for Day 41 was to create a custom Docker image based on `ubuntu:24.04`. The image needed to have Apache2 installed and configured to listen on port `3003` instead of the default port 80.

## 2. The Dockerfile

A `Dockerfile` is a script containing a series of instructions for building a Docker image. Here is a breakdown of the `Dockerfile` used for this task:

```dockerfile
# /opt/docker/Dockerfile
FROM ubuntu:24.04

# Install apache2
RUN apt-get update && \
    apt-get install -y apache2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Change Apache to listen on port 3003
RUN sed -i 's/80/3003/' /etc/apache2/ports.conf && \
    sed -i 's/80/3003/' /etc/apache2/sites-available/000-default.conf

# Expose port 3003
EXPOSE 3003

# Start apache in foreground
CMD ["apachectl", "-D", "FOREGROUND"]
```

### Key Instructions Explained:

- **`FROM ubuntu:24.04`**: Specifies the base image for our build. We start with a clean Ubuntu 24.04 environment.
- **`RUN apt-get ...`**: This command executes shell commands to install Apache. 
    - `apt-get update`: Refreshes the package index.
    - `apt-get install -y apache2`: Installs the Apache web server.
    - `apt-get clean && rm -rf /var/lib/apt/lists/*`: Cleans up the apt cache to reduce the final image size.
- **`RUN sed -i ...`**: These commands modify the Apache configuration files to change the listening port from `80` to `3003`.
- **`EXPOSE 3003`**: Informs Docker that the container listens on port `3003` at runtime. This is good practice for documentation and enables easy port mapping.
- **`CMD ["apachectl", "-D", "FOREGROUND"]`**: Sets the default command to run when a container is started from this image. Running Apache in the foreground is a containerization best practice, as containers typically exit if the main process stops.

## 3. Building and Running the Image

Once the `Dockerfile` is created, you can build and run the image using the following commands:

```bash
# Build the Docker image
sudo docker build -t custom-apache:3003 /opt/docker/

# Run a container from the new image
sudo docker run -d -p 3003:3003 --name apache_test custom-apache:3003
```

- `docker build -t custom-apache:3003 .`: Builds the image and tags it as `custom-apache` with the version `3003`.
- `docker run -d -p 3003:3003 ...`: Runs a container in detached mode (`-d`) and maps the host's port `3003` to the container's port `3003` (`-p 3003:3003`).

## 4. Verification

To verify that Apache is running correctly on port `3003` inside the container, you can use `docker exec`:

```bash
sudo docker exec -it apache_test curl -I http://localhost:3003
```

A successful response, such as `HTTP/1.1 200 OK`, confirms that the setup is working as expected.

```