# Day 2 – Fix MariaDB Service (xFusionCorp Nautilus)

## 🔧 Task

The Nautilus application in Stratos DC is failing because the database service is down.  
You need to troubleshoot and bring **MariaDB** back up on the **DB Server**.

**Requirements:**

- Check and fix MariaDB service on `stdb01.stratos.xfusioncorp.com`
- Ensure it is enabled on boot
- Verify application can connect again

## 🖥️ Target Server

- Hostname: `stdb01.stratos.xfusioncorp.com`
- IP: `172.16.239.10`
- User: `peter`
- Password: `Sp!dy`

## 📌 Notes

Check service logs (`journalctl -xeu mariadb`) if restart fails. Common issues include:

- Missing/corrupt data files
- Permission issues on `/var/lib/mysql`
- Port 3306 conflicts
