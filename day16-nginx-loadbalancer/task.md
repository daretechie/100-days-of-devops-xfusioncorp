# Day 16 – Configure Nginx Load Balancer on LBR Server (xFusionCorp)

## 🔧 Task

The Nautilus production support team needs to configure the LBR server as the final step of migrating to a high availability stack.

**Requirements:**

1. Install **nginx** on LBR server.
2. Configure load balancing in the main nginx configuration file `/etc/nginx/nginx.conf`.
3. Use **all App Servers** in the upstream block (do not modify Apache configs on app servers).
4. Ensure **Apache service is up and running** on all App Servers.
5. After configuration, the website should be accessible via the **StaticApp button** on the top bar.

## 🖥️ Target Server

- Hostname: **lbr.stratos.xfusioncorp.com**
- IP: `172.16.238.14`
- User: **thor**
- Password: `mjolnir123`

## 📌 Notes

- Only `/etc/nginx/nginx.conf` should be updated (not separate files in `conf.d/`).
- Assume App Servers run Apache on their configured ports (e.g., 8082).
- Typical App Servers:
  - stapp01: 172.16.238.10:8089
  - stapp02: 172.16.238.11:8089
  - stapp03: 172.16.238.12:8089
