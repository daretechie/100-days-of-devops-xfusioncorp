# Day 7 – Configure Password-less SSH from Jump Host to App Servers (xFusionCorp)

## 🔧 Task
The system admins have scripts on the jump host that must run on all app servers without password prompts.  
We need to configure **password-less SSH** from `thor` (jump host) to all app servers using their respective sudo users.

### Requirements:
- Jump Host user: `thor`
- App Server 1: user `tony` (`stapp01.stratos.xfusioncorp.com`)
- App Server 2: user `steve` (`stapp02.stratos.xfusioncorp.com`)
- App Server 3: user `banner` (`stapp03.stratos.xfusioncorp.com`)
- No password prompts for SSH logins.

## 📌 Notes
- This setup is from **thor**’s account, so commands should be run after switching to `thor`.
- The `ssh-copy-id` tool will copy public keys to each target server.
