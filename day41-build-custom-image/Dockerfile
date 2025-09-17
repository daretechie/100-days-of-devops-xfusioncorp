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