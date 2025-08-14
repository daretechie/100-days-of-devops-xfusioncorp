# Day 6 - Install Cronie & Setup Cron Job

## 🔍 Overview
`cronie` is the default cron daemon in CentOS/RHEL-based systems, used for scheduling tasks to run at fixed intervals, times, or dates.

## 🛠️ Implementation Steps

### 1. Install Cronie
```bash
# Install the cronie package
yum install -y cronie
```

### 2. Enable & Start the Cron Service
```bash
# Enable crond to start on boot
systemctl enable crond

# Start the crond service
systemctl start crond

# Verify the service status
systemctl status crond
```

### 3. Add Root Cron Job
```bash
   */5 * * * * echo hello > /tmp/cron_text
```

### 4. Verify the Setup
```bash
# List all cron jobs for current user
crontab -l

# For root's crontab
sudo crontab -l
```

## 📝 Important Notes

### File Operations
- `>` overwrites the file each time
- `>>` appends to the file instead of overwriting
- `2>&1` redirects both standard output and error to the file

### Cron Time Format
```
*    *    *    *    *  command to execute
┬    ┬    ┬    ┬    ┬
│    │    │    │    │
│    │    │    │    └─ Day of week (0-6, 0=Sunday)
│    │    │    └────── Month (1-12)
│    │    └─────────── Day of month (1-31)
│    └──────────────── Hour (0-23)
└───────────────────── Minute (0-59)
```

## 💡 Best Practices
1. **Editing Crontabs**
   - Use `crontab -e` for current user
   - Use `sudo crontab -e` for root
   - Always keep a backup of important crontabs

2. **Logging**
   - Redirect output to log files for debugging:
     ```bash
     */5 * * * * /path/to/script.sh >> /var/log/script.log 2>&1
     ```

3. **Security**
   - Be cautious with scripts run as root
   - Set appropriate file permissions
   - Consider using `@reboot` for one-time boot scripts

## 🚨 Troubleshooting

### Common Issues
1. **Cron Job Not Running**
   - Check cron service status: `systemctl status crond`
   - Verify cron logs: `grep CRON /var/log/cron`
   - Ensure PATH is set in the script or use full paths

2. **Permission Issues**
   - Check file permissions on scripts
   - Verify user has execute permissions

## 📚 Additional Resources
- [Cron HowTo](https://help.ubuntu.com/community/CronHowto)
- [Crontab Manual](https://man7.org/linux/man-pages/man5/crontab.5.html)
- [Cron Timing Generator](https://crontab.guru/)