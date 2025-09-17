# Day 40: Install & Configure Apache2 in a Docker Container

## 1. Objective

The goal for Day 40 was to install and configure the Apache2 web server inside a Docker container named `kkloud`. The primary requirements were to change Apache's default listening port from 80 to **5004** and ensure the service was running correctly.

## 2. Key Steps

The task was automated using a shell script (`configure_apache.sh`) that executes commands inside the running container using `docker exec`.

### Step 1: Install Apache2

First, we updated the package manager and installed `apache2` inside the `kkloud` container.

```bash
docker exec -it kkloud bash -c "apt-get update && apt-get install -y apache2"
```

### Step 2: Configure Listening Port

To change the port, we modified two key Apache configuration files:

1.  **`ports.conf`**: This file defines the primary port Apache listens on. We used `sed` to find the line starting with `Listen` and replaced it to specify port `5004`.

    ```bash
    docker exec -it kkloud bash -c "sed -i 's/^Listen .*/Listen 5004/' /etc/apache2/ports.conf"
    ```

2.  **`000-default.conf`**: This file configures the default virtual host. We updated the `<VirtualHost>` directive to match the new port.

    ```bash
    docker exec -it kkloud bash -c "sed -i 's/<VirtualHost \*:.*>/<VirtualHost *:5004>/' /etc/apache2/sites-available/000-default.conf"
    ```

### Step 3: Test and Restart

It is crucial to validate the configuration before applying changes to prevent service disruptions.

```bash
# Test the Apache configuration for syntax errors
docker exec -it kkloud bash -c "apache2ctl configtest"

# Restart the Apache service to apply the new configuration
docker exec -it kkloud bash -c "service apache2 restart"
```

### Step 4: Verify the Change

Finally, we confirmed that Apache was successfully listening on the new port using `ss`.

```bash
docker exec -it kkloud bash -c "ss -ltnp | grep 5004"
```

This command filters the list of listening network ports for an entry matching `5004`, confirming our changes were successful.

## 3. Lessons Learned

- **`docker exec` is essential** for managing services within running containers without needing to log into them interactively.
- **`sed` is a powerful tool** for in-place file modifications, making it ideal for automated configuration changes.
- **Always validate configurations** (`apache2ctl configtest`) before restarting a service to avoid downtime.