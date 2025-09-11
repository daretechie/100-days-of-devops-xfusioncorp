# Day 35: Docker Installation

This document provides notes on installing Docker on a Linux system, specifically CentOS/RHEL, as is common in the xFusionCorp environment.

## What is Docker?

Docker is an open platform for developing, shipping, and running applications. Docker enables you to separate your applications from your infrastructure so you can deliver software quickly. With Docker, you can manage your infrastructure in the same ways you manage your applications. By taking advantage of Docker’s methodologies for shipping, testing, and deploying code quickly, you can significantly reduce the delay between writing code and running it in production.

### Docker Images

A Docker image is a lightweight, standalone, executable package of software that includes everything needed to run an application: code, runtime, system tools, system libraries and settings.

### Docker Containers

A Docker container is a runtime instance of a Docker image. It is a lightweight, portable, and self-sufficient environment for an application. You can create, start, stop, move, or delete a container using the Docker API or CLI.

### Docker Compose

Docker Compose is a tool for defining and running multi-container Docker applications. With Compose, you use a YAML file to configure your application’s services. Then, with a single command, you create and start all the services from your configuration. This is particularly useful for development environments and automated testing.

### Docker Hub / Registry

A Docker registry is a storage and distribution system for named Docker images. The same way you would use a Git repository to store and share source code, you use a Docker registry to store and share Docker images. Docker Hub is the default public registry that Docker uses.

## Docker Installation Steps

### 1. Setting up Docker Repository

Before installing Docker Engine for the first time on a new host machine, you need to set up the Docker repository. Afterward, you can install and update Docker from the repository.

#### Install required packages

`yum-utils` provides the `yum-config-manager` utility, and `device-mapper-persistent-data` and `lvm2` are required by the `devicemapper` storage driver.

```bash
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
```

#### Add Docker repository

Use the following command to set up the stable repository.

```bash
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
```

### 2. Installing Docker Engine

Now that the repository is set up, we can install the Docker packages.

#### Install Docker CE

Install the latest version of Docker Engine and containerd.

```bash
sudo yum install -y docker-ce docker-ce-cli containerd.io
```

### 3. Managing Docker Service

After installation, the Docker service needs to be started and enabled to run on boot.

#### Start and enable Docker

```bash
sudo systemctl start docker
sudo systemctl enable docker
```

### 4. Post-installation steps

#### Manage Docker as a non-root user

To run Docker commands without having to use `sudo`, you need to add your user to the `docker` group.

```bash
sudo usermod -aG docker <your-user>
```

After running this command, you will need to log out and log back in for the changes to take effect. For the `thor` user on the app servers, the command would be:

```bash
sudo usermod -aG docker thor
```
This completes the installation and basic configuration of Docker.