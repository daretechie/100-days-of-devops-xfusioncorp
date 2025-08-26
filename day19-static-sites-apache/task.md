# Day 19 – Static Websites Setup on Apache (xFusionCorp)

## 🔧 Task

The system admin team at xFusionCorp Industries needs to prepare Apache for hosting two static websites.

**Requirements:**

1. Install **httpd** package and dependencies on **App Server 2**.
2. Configure Apache to serve on port **3000**.
3. Copy the website backups from jump host:
   - `/home/thor/official` → `/var/www/html/official/`
   - `/home/thor/games` → `/var/www/html/games/`
4. Ensure the sites are available at:
   - `http://localhost:3000/official/`
   - `http://localhost:3000/games/`
5. Verify using `curl` on App Server 2.

## 🖥️ Target Server

- **App Server 2**
  - Hostname: `stapp02.stratos.xfusioncorp.com`
  - IP: `172.16.238.11`
  - User: `banner`
  - Password: `BigGr33n`

## 📌 Notes

- Only port **3000** should be used for Apache.
- Ensure correct document root and directory permissions.
