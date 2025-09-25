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