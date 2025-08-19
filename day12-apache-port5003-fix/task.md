# Day 12 – Fix Apache Port 5003 Connectivity Issue (xFusionCorp)

## 🔧 Task

The monitoring tool has reported that Apache service is not reachable on port **5003** on one of the app servers.

**Requirements:**

- Ensure Apache (`httpd`) is running on **port 5003**.
- Verify it is listening correctly.
- Fix any firewall/iptables issues preventing access from Jump Host.
- Confirm accessibility via:
  ```bash
  curl http://stapp01:5003
  ```

```

## 🖥️ Target Server

- Hostname: **stapp01.stratos.xfusioncorp.com**
- IP: `172.16.238.10`
- User: **tony**
- Password: `Ir0nM@n`

## 📌 Notes

The issue could be:

1. Apache service not running.
2. Wrong port configuration.
3. Firewall blocking the port.
```
