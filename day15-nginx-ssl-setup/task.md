# Day 15 – Install and Configure Nginx with SSL on App Server 2 (xFusionCorp)

## 🔧 Task

The system admins team of xFusionCorp Industries needs to prepare App Server 2 for a new application deployment.

**Requirements:**

1. Install and configure **nginx** on App Server 2.
2. Move the self-signed SSL certificate and key from `/tmp/nautilus.crt` and `/tmp/nautilus.key` to an appropriate location (`/etc/nginx/ssl/`).
3. Configure Nginx to use the SSL cert and key.
4. Create an `index.html` file under Nginx document root with content `Welcome!`.
5. Verify by accessing App Server 2 from the jumphost:
   ```bash
   curl -Ik https://stapp02
   ```

````

## 🖥️ Target Server

- Hostname: **stapp02.stratos.xfusioncorp.com**
- IP: `172.16.238.11`
- User: **steve**
- Password: `Am3ric@`

## 📌 Notes

- Use `/etc/nginx/ssl/` for storing certificates.
- Ensure Nginx listens on **443** with SSL enabled.
- Verification is via curl from the jumphost.


```bash
git add day15-nginx-ssl-setup
git commit -m "Day 15 Task 15: Installed and configured nginx with SSL on App Server 2"
git push
```


````
