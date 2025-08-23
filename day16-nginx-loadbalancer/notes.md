# Notes – Day 16 Task 16: Configure Nginx as a Load Balancer

## 📝 Task Summary

The goal was to configure the LBR server to act as a load balancer for the three backend application servers (stapp01, stapp02, stapp03). This involved installing Nginx, defining an upstream group of servers, and proxying incoming traffic to that group.

---

## 🔍 Troubleshooting & Steps Taken

1.  **Installed Nginx:**
    The first step was to install the Nginx web server on the LBR host.
    ```bash
    sudo yum install -y nginx
    ```

2.  **Backed Up Original Configuration:**
    Before making changes, I created a backup of the default Nginx configuration file. This is a critical best practice to allow for easy rollbacks.
    ```bash
    sudo cp /etc/nginx/nginx.conf /etc/nginx/nginx.conf.bak
    ```

3.  **Configured Load Balancer:**
    I modified the `/etc/nginx/nginx.conf` file to set up the load balancer.
    -   An `upstream` block named `app_servers` was created to list the backend application servers. Nginx defaults to a round-robin distribution of traffic between these servers.
    -   The `server` block was configured to listen on port `80`.
    -   A `location /` block was added to proxy all incoming requests (`proxy_pass`) to the `http://app_servers` upstream group.

4.  **Restarted Nginx:**
    After applying the new configuration, I restarted the Nginx service to load the changes.
    ```bash
    sudo systemctl restart nginx
    ```

---

## ✅ Verification

-   **Check Nginx Service Status:**
    Confirmed that the Nginx service was active and running without errors.
    ```bash
    sudo systemctl status nginx
    ```

-   **Test Configuration Syntax:**
    Before restarting, it's always a good idea to test the configuration syntax for errors.
    ```bash
    sudo nginx -t
    ```

-   **Verify from Jump Host:**
    From the jump host, I used `curl` to send a request to the LBR server. The response should come from one of the backend app servers.
    ```bash
    curl http://lbr.stratos.xfusioncorp.com
    ```
    Running this command multiple times would ideally show responses from different backend servers, confirming the round-robin load balancing.

-   **UI Verification:**
    The final check was to use the "StaticApp" button in the KodeKloud Engineer UI, which should correctly display the website served by the backend servers.

---

## 💡 Lesson Learned

-   **Upstream Blocks are Key:** The `upstream` directive is the standard way to define a pool of servers for load balancing in Nginx.
-   **Default Load Balancing:** By default, Nginx uses a round-robin algorithm, which is suitable for distributing load evenly across servers of similar capacity.
-   **Configuration Backup:** Always back up configuration files before editing. A simple `cp` command can save a lot of time if a configuration error occurs.
-   **`nginx -t` is Your Friend:** This command is invaluable for catching syntax errors before they take down your web server.

---

##  Bash Script (`setup_lbr.sh`)

Here is the script that automates the entire process:

```bash
#!/bin/bash
# Day 16 Task 16 - Configure Nginx Load Balancer on LBR server

# Install nginx
sudo yum install -y nginx

# Enable and start nginx
sudo systemctl enable nginx
sudo systemctl start nginx

# Backup original nginx.conf
sudo cp /etc/nginx/nginx.conf /etc/nginx/nginx.conf.bak

# Configure load balancing in nginx.conf
sudo bash -c "cat > /etc/nginx/nginx.conf" <<EOL
user  nginx;
worker_processes  auto;

error_log  /var/log/nginx/error.log;
pid        /var/run/nginx.pid;

events {
    worker_connections  1024;
}

http {
    upstream app_servers {
        server 172.16.238.10:8082;
        server 172.16.238.11:8082;
        server 172.16.238.12:8082;
    }

    server {
        listen 80;

        location / {
            proxy_pass http://app_servers;
        }
    }
}
EOL

# Restart nginx to apply changes
sudo systemctl restart nginx

# Verify nginx status
sudo systemctl status nginx --no-pager
```