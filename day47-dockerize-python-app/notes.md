# Notes – Day 47 Task 47: Dockerize Python App

## ამოცანა (Task)

A Python app needs to be Dockerized and deployed on App Server 2.

**მოთხოვნები (Requirements):**

- Create a `Dockerfile` under `/python_app`.
- Base image: any official Python image.
- Install dependencies from `requirements.txt` (found under `/python_app/src/`).
- Expose port `3000`.
- Run `server.py` using CMD.
- Build image: `nautilus/python-app`.
- Create container: `pythonapp_nautilus`.
- Map host port `8094` → container port `3000`.

## Dockerfile

Here is the `Dockerfile` used to containerize the Python application:

```dockerfile
# Day 47 Task 47 – Dockerize Python App
# or any python base image
FROM python:3.11-slim     

# Set working directory
WORKDIR /app

# Copy source code
COPY src/ /app/

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose port 3000
EXPOSE 3000

# Run the server
CMD ["python", "server.py"]
```

## ✅ Commands Used

Here are the commands used to build and run the Docker container:

```bash
# go to /python_app directory
cd /python_app

# build the image
sudo docker build -t nautilus/python-app .

# run the container mapping host port 8094 to container port 3000
sudo docker run -d --name pythonapp_nautilus -p 8094:3000 nautilus/python-app

# verify
sudo docker ps
curl http://localhost:8094/
```

## 💡 Lesson Learned

- **`FROM python:3.11-slim`**: This specifies the base image for our Docker container. Using a slim version helps to keep the image size small.
- **`WORKDIR /app`**: This sets the working directory inside the container to `/app`. All subsequent commands will be run from this directory.
- **`COPY src/ /app/`**: This copies the contents of the `src` directory from the host machine to the `/app` directory inside the container.
- **`RUN pip install --no-cache-dir -r requirements.txt`**: This command installs the Python dependencies listed in the `requirements.txt` file. The `--no-cache-dir` option is used to reduce the image size by not storing the downloaded packages in the cache.
- **`EXPOSE 3000`**: This informs Docker that the container listens on port `3000` at runtime. This is mainly for documentation purposes.
- **`CMD ["python", "server.py"]`**: This specifies the command to run when the container starts. In this case, it runs the `server.py` file using the Python interpreter.
- **`docker build -t nautilus/python-app .`**: This command builds a Docker image from the `Dockerfile` in the current directory. The `-t` flag is used to tag the image with a name and optionally a tag in the 'name:tag' format.
- **`docker run -d --name pythonapp_nautilus -p 8094:3000 nautilus/python-app`**: This command runs a Docker container from the `nautilus/python-app` image.
    - `-d`: Runs the container in detached mode (in the background).
    - `--name pythonapp_nautilus`: Assigns a name to the container.
    - `-p 8094:3000`: Maps port `8094` on the host to port `3000` on the container.