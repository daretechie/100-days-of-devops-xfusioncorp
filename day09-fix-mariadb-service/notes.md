Got it ✅ — your notes are already solid, but I can make them sharper, more professional, and consistent in tone so they read like a proper incident report + learning log. Here’s a polished rewrite combining clarity, structure, and storytelling flow:

---

# Day 9 Notes – MariaDB Service Disruptions and Resolutions

## 🚨 Incident Overview

The **Nautilus application** experienced downtime due to its backend database connection failing on server `stdb01`. Investigation revealed that the **MariaDB service**, which powers the application’s data layer, was not running.

Two separate root causes were identified across scenarios:

1. **Service Not Enabled on Boot** – MariaDB was installed but not configured to auto-start after a reboot.
2. **Permission Error** – The service failed to start because it lacked permission to create its PID file in `/run/mariadb/`.

---

## 🛠️ Troubleshooting & Resolution

### Case 1: Service Not Enabled on Boot

1. **Check Service Status**

   ```bash
   systemctl status mariadb
   ```

   → Service was `inactive (dead)`.

2. **Start the Service**

   ```bash
   systemctl start mariadb
   ```

3. **Enable Auto-start**

   ```bash
   systemctl enable mariadb
   ```

   → Ensures MariaDB starts automatically after reboots.

4. **Verify Port Listening**

   ```bash
   ss -tulnp | grep 3306
   ```

   → Confirmed MariaDB was bound to port `3306`.

5. **Confirm Application Connectivity**
   Verified that the Nautilus application could connect successfully.

---

### Case 2: Permission Error in `/run/mariadb/`

1. **Check Service Status**

   ```bash
   systemctl status mariadb
   ```

2. **Inspect Logs**

   ```bash
   journalctl -xeu mariadb

   sudo cat /var/log/mariadb/mariadb.log
   ```

   Logs showed:

   ```
   [ERROR] mariadbd: Can't create/write to file '/run/mariadb/mariadb.pid' (Errcode: 13 "Permission denied")
   ```

3. **Check Directory Ownership**

   ```bash
   ls -ld /run/mariadb
   ```

   → Ownership was incorrect.

4. **Correct Permissions**

   ```bash
   sudo chown mysql:mysql /run/mariadb
   sudo chmod 755 /run/mariadb
   ```

5. **Restart Service**

   ```bash
   systemctl restart mariadb
   systemctl status mariadb
   ```

6. **Enable Auto-start**

   ```bash
   systemctl enable mariadb
   ```

7. **Verify Port Binding & Connectivity**

   ```bash
   ss -tulnp | grep 3306
   ```

   → Confirmed MariaDB was listening and application restored.

---

---

## 🔍 Root Cause Analysis

- **Case 1:** The service was not enabled to start on boot. A system reboot caused downtime.
- **Case 2:** Incorrect directory ownership in `/run/mariadb/` blocked MariaDB from creating its PID file.

**Additional Possible Causes:**

- Misconfigured `my.cnf` settings.
- Resource exhaustion (CPU, memory, or disk).
- Corrupted database/log files.
- Incorrect file permissions in data directories.

---

## 💡 Key Lessons & Best Practices

- **Always Enable Critical Services** – Ensure essential services are configured to auto-start.
- **Logs First** – `journalctl -xeu <service>` often points straight to the root cause.
- **Permissions Matter** – Incorrect file/directory ownership is a common source of failures.
- **Temporary Filesystems Awareness** – `/run` is cleared on reboot. Use `systemd-tmpfiles.d` for persistent recreation of runtime directories if needed.
- **Proactive Monitoring** – Use monitoring/alerting to detect service failures early.
- **Know Your Stack** – Understanding dependencies (e.g., Nautilus ⇄ MariaDB) speeds up resolution.
- **Regular Verification** – After updates or reboots, validate that all critical services are healthy.

---

👉 **Next Step**: For the permission issue, consider adding a **`systemd/tmpfiles.d` rule** to ensure `/run/mariadb/` is recreated with the correct ownership on every reboot.

---

Would you like me to also **condense this into a short “executive-style incident report”** (for management updates), or do you prefer to keep it in this detailed technical log format?
