# Day 10 – Website Backup Script (xFusionCorp)

## 🔧 Task

The production support team needs a script to automate website backups.

**Requirements:**

- Script name: `news_backup.sh`
- Location: `/scripts` on App Server 1
- Backup target: `/var/www/html/news`
- Archive name: `xfusioncorp_news.zip`
- Store archive in `/backup/` (temporary)
- Copy archive to **Nautilus Backup Server** in `/backup/`
- Script should **not** prompt for a password.
- User on App Server 1 (e.g., `tony`) should be able to run it.

## 🖥️ Target Server

- Hostname: `stapp01.stratos.xfusioncorp.com`
- IP: `172.16.238.10`
- User: `tony`
- Password: `Ir0nM@n`

## 📌 Notes

- Passwordless SSH must be configured between App Server 1 (`tony`) and Nautilus Backup Server (`clint`).
