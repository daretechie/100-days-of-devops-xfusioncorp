# Day 20: Setup Nginx + PHP-FPM

## 🎯 Objective

Configure Nginx to work with PHP-FPM 8.1 on App Server 3 to serve a PHP-based application. This involves setting up Nginx as a web server and configuring it to pass PHP requests to the PHP-FPM service for processing.

## 📋 Key Requirements

- **Nginx:**
  - Serve traffic on port `8094`.
  - Use `/var/www/html` as the document root.
- **PHP-FPM:**
  - Use PHP version 8.1.
  - Communicate via a Unix socket at `/var/run/php-fpm/default.sock`.
- **Integration:**
  - Nginx must correctly process `.php` files by forwarding them to the PHP-FPM service.

## ⚙️ Execution Analysis

The `setup_nginx_phpfpm.sh` script automates the entire configuration process.

1.  **Package Installation:**
    - Installs `nginx`, `php`, `php-fpm`, and `php-cli`. These packages provide the web server, the PHP interpreter, the FastCGI Process Manager, and the command-line interface for PHP, respectively.

2.  **PHP-FPM Configuration (`/etc/php-fpm.d/www.conf`):**
    - **Socket Creation:** The script first ensures the directory for the socket (`/var/run/php-fpm`) exists.
    - **Pool Configuration:** A new pool configuration is created for `www`.
    - `listen = /var/run/php-fpm/default.sock`: This is the most critical part. It instructs PHP-FPM to listen on a Unix socket instead of a TCP port. Sockets are generally faster for local inter-process communication.
    - `user = nginx`, `group = nginx`: The user and group are set to `nginx` to ensure the web server has the necessary permissions to read from and write to the socket.

3.  **Nginx Configuration (`/etc/nginx/conf.d/php_app.conf`):**
    - **Server Block:** A new server block is defined to handle requests for the PHP application.
    - `listen 8094;`: Configures Nginx to listen on the required custom port.
    - `root /var/www/html;`: Sets the document root.
    - **PHP Location Block (`location ~ \.php$`):**
        - This block matches any request ending in `.php`.
        - `fastcgi_pass unix:/var/run/php-fpm/default.sock;`: This directive tells Nginx where to send the FastCGI requests—to the Unix socket created by PHP-FPM.
        - `fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;`: This is a crucial parameter. It constructs the absolute path to the PHP script and passes it to PHP-FPM, so PHP-FPM knows which file to execute.

4.  **Deployment & Verification:**
    - A test `index.php` file containing `phpinfo();` is created in the document root to allow for easy verification.
    - The `php-fpm` and `nginx` services are enabled and restarted to apply the new configurations.
    - `curl -I http://localhost:8094/index.php` is used to send a request to the server and verify that it returns a `200 OK` status, confirming that Nginx and PHP-FPM are working together correctly.

## 💡 Key Learnings

- **Socket vs. TCP for PHP-FPM:** For communication between Nginx and PHP-FPM on the same server, Unix sockets are preferred over TCP ports. They offer better performance as they don't have the overhead of the network stack.
- **Permissions are Key:** The Nginx user (`nginx`) needs permission to access the PHP-FPM socket. Setting the `listen.owner` and `listen.group` in the PHP-FPM pool configuration is essential to avoid "502 Bad Gateway" errors.
- **`fastcgi_pass` Directive:** This is the core of the Nginx-to-PHP-FPM connection. It can point to a TCP address (`127.0.0.1:9000`) or a Unix socket (`unix:/path/to/socket`).
- **`SCRIPT_FILENAME` Parameter:** Nginx does not execute PHP code itself; it only serves files. This parameter is vital for telling the PHP-FPM process the exact location of the script to be executed.