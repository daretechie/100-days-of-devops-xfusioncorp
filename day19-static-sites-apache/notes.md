# Notes: Setting Up Static Websites on Apache

This document outlines the process of configuring an Apache web server to host two static websites on a non-standard port, as per the requirements of the `day19-static-sites-apache` task.

## 🎯 Objective

The primary goal is to set up two distinct static websites, `official` and `games`, on App Server 2. This involves installing Apache, changing its default listening port to `3000`, and deploying the website content from a backup location.

## 🛠️ Key Configuration Steps

### 1. Why Port 3000?

- **Application Requirement:** The application team specifically requested port `3000` for their services.
- **Avoiding Conflicts:** Running Apache on a non-default port prevents potential conflicts with other web services (like proxy servers or other applications) that might be using the standard port `80`.

### 2. Document Root Configuration

Two separate document roots were established to host the websites independently:
- **Official Site:** `/var/www/html/official/` (content sourced from `/home/thor/official/`)
- **Games Site:** `/var/www/html/games/` (content sourced from `/home/thor/games/`)

## 📜 Commands Breakdown

The `setup_static_sites.sh` script automates the entire setup process. Here’s a breakdown of the commands used:

1.  **Install Apache:**
    ```bash
    sudo yum install -y httpd
    ```
    This command installs the Apache HTTP Server package (`httpd`) and all its necessary dependencies.

2.  **Change Listening Port:**
    ```bash
    sudo sed -i 's/^Listen 80/Listen 3000/' /etc/httpd/conf/httpd.conf
    ```
    The `sed` command is used to find the line `Listen 80` in the main Apache configuration file and replace it with `Listen 3000`. This is the crucial step to change the serving port.

3.  **Create Directories and Copy Content:**
    ```bash
    sudo mkdir -p /var/www/html/official /var/www/html/games
    sudo cp -r /home/thor/official/* /var/www/html/official/
    sudo cp -r /home/thor/games/* /var/www/html/games/
    ```
    These commands first create the target directories for the websites and then recursively copy the content from the source backup locations.

4.  **Set File Permissions:**
    ```bash
    sudo chown -R apache:apache /var/www/html/official /var/www/html/games
    ```
    This is a critical security and operational step. It changes the ownership of the website files to the `apache` user and group, which is the user the Apache server runs as. This ensures that Apache has the necessary permissions to read and serve the files.

5.  **Enable and Restart Apache:**
    ```bash
    sudo systemctl enable httpd
    sudo systemctl restart httpd
    ```
    `systemctl enable httpd` ensures that Apache will start automatically on server boot. `systemctl restart httpd` applies all the configuration changes we've made.

## ✅ Verification

To confirm that the websites are being served correctly, the following `curl` commands were used:
```bash
curl http://localhost:3000/official/
curl http://localhost:3000/games/
```
A successful `curl` command will return the HTML content of the `index.html` file from each respective directory.

## 💡 Key Takeaways

- **Configuration Management:** Directly editing configuration files using scripts (`sed`) is a powerful way to automate server setup.
- **File Permissions are Crucial:** Incorrect file permissions are a common cause of "403 Forbidden" errors. Always ensure the web server user (`apache` in this case) can access the files it needs to serve.
- **Verification is Key:** Always test changes locally (`curl localhost:[port]`) before considering the task complete. This helps isolate issues quickly.

## 🛡️ Security Considerations

- **Principle of Least Privilege:** The `chown` command is a good example of this principle. The web server only has permissions to read the files it needs to serve, not to write or execute them.
- **Firewall Rules:** In a production environment, you would need to open port `3000` in the firewall (e.g., `firewalld` or `iptables`) to allow external traffic to reach the web server.
- **SELinux:** If SELinux is enabled, you might need to set the correct security context for the web content and the port.

## 🔍 Troubleshooting

- **`curl` fails:**
    - Check if `httpd` is running: `systemctl status httpd`
    - Check if Apache is listening on port 3000: `ss -tulpn | grep 3000`
    - Check the Apache error logs: `tail -f /var/log/httpd/error_log`
- **403 Forbidden Error:**
    - Verify file permissions and ownership are correct (`ls -l /var/www/html`).
    - Check directory permissions. Apache needs execute permissions on all parent directories.
- **SELinux Issues:**
    - Check the audit log for denials: `ausearch -m avc -ts recent`
    - Use `semanage` to add the correct context for the port if needed.