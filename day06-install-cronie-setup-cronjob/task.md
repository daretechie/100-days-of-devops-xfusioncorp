# Day 6 – Install Cronie & Create Root Cron Job (xFusionCorp)

## 🔧 Task
The Nautilus system admins want to test automated task scheduling before deploying their production scripts.

### Requirements:
1. Install `cronie` package on all Nautilus App Servers.
2. Start and enable `crond` service.
3. Add the following cron job for the **root** user:
```

\*/5 \* \* \* \* echo hello > /tmp/cron\_text

```

## 🖥️ Target Servers
- App Server 1: `stapp01.stratos.xfusioncorp.com`
- App Server 2: `stapp02.stratos.xfusioncorp.com`
- App Server 3: `stapp03.stratos.xfusioncorp.com`

## 📌 Notes
- Cron job should run every 5 minutes.
- The job overwrites `/tmp/cron_text` each time.
```