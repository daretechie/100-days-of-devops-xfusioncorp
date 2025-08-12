# Day 5 – Install and Permanently Disable SELinux (xFusionCorp)

## 🔧 Task
Following a security audit, the team has decided to prepare App Server 3 for SELinux testing.

### Requirements:
1. Install the required SELinux packages.
2. Permanently disable SELinux.
3. Do not reboot (maintenance reboot scheduled tonight).

## 🖥️ Target Server
- Hostname: `stapp03.stratos.xfusioncorp.com`
- IP: `172.16.238.12`

## 📌 Notes
- Disregard the current SELinux runtime status (`getenforce`).
- After the scheduled reboot, SELinux should be **disabled**.
