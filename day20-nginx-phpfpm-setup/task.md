# Day 20 – Setup Nginx + PHP-FPM for PHP App (xFusionCorp)

## 🔧 Task

The application team wants to launch a new PHP-based app on **App Server 3**.  
We need to configure **nginx** with **php-fpm 8.1** as per requirements.

**Requirements:**

1. Install **nginx** on App Server 3 and configure it to:
   - Serve on port **8094**
   - Use `/var/www/html` as document root
2. Install **php-fpm 8.1** on App Server 3.
   - It must use the unix socket `/var/run/php-fpm/default.sock`
   - Ensure parent directories exist
3. Configure **nginx** and **php-fpm** to work together.
4. Validate with:
   ```bash
   curl http://stapp03:8094/index.php
   ```

---

## 🖥️ Target Server

- **App Server 3**

  - Hostname: `stapp03.stratos.xfusioncorp.com`
  - IP: `172.16.238.12`
  - User: `banner`
  - Password: `BigGr33n`

## 📌 Notes

- `index.php` should be correctly processed by php-fpm via nginx.
- Use socket instead of TCP for PHP-FPM.
