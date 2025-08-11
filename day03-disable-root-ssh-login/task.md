# Day 3 – Disable Direct Root SSH Login (xFusionCorp)

## 🔧 Task
Following recent security audits, the xFusionCorp security team requires disabling **direct SSH root login** on all application servers in the Stratos Datacenter.

**Scope:**
- App Server 1: `stapp01.stratos.xfusioncorp.com` – `172.16.238.10`
- App Server 2: `stapp02.stratos.xfusioncorp.com` – `172.16.238.11`
- App Server 3: `stapp03.stratos.xfusioncorp.com` – `172.16.238.12`

## 📌 Requirements
- Edit `/etc/ssh/sshd_config`
- Set: PermitRootLogin no

- Restart SSH service after changes.

## 🖥️ Reference
- To test: `ssh root@<server-ip>` should fail after configuration.

