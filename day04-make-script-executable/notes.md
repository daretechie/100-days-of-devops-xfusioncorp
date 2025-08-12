# Notes – Day 3: Disable Root SSH Login

## 🔍 Understanding Root SSH Login Security

### Key Security Concerns:
- Root account is a common target for brute-force attacks
- Direct root login provides no accountability (all actions are logged as root)
- Compromised root credentials give attackers full system access
- Better to use `sudo` for privilege escalation when needed

### Benefits of Disabling Root SSH Login:
- Forces attackers to guess both username and password
- Creates an audit trail through individual user accounts
- Follows the principle of least privilege
- Reduces the attack surface of your server

## 🛠 Implementation Details

### Command Used
```bash
# Backup current SSH config
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak

# Edit SSH config to disable root login
sudo sed -i 's/^#*PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config

# Restart SSH service to apply changes
sudo systemctl restart sshd
```

### Configuration Breakdown:
- `PermitRootLogin no`: Completely disables root login via SSH
- Alternative options:
  - `prohibit-password`: Allows root login only with key-based authentication
  - `without-password`: Same as prohibit-password (deprecated)

## 🔒 Verification Steps

```bash
# Check current SSH configuration
echo "=== Current SSH Root Login Setting ==="
sudo grep -i "PermitRootLogin" /etc/ssh/sshd_config

# Expected output:
# PermitRootLogin no

# Test SSH login as root (should fail)
echo "\n=== Testing SSH Root Access (should fail) ==="
ssh -o PreferredAuthentications=password -o PubkeyAuthentication=no \
    -o ConnectTimeout=5 root@localhost 2>&1 | grep -i "permission denied"

# Verify SSH service status
echo "\n=== SSH Service Status ==="
systemctl status sshd --no-pager
```

## 🔄 Rollback Procedure
If you need to re-enable root login:
```bash
# Restore from backup
sudo cp /etc/ssh/sshd_config.bak /etc/ssh/sshd_config

# Or manually edit and set:
# PermitRootLogin yes

# Restart SSH service
sudo systemctl restart sshd
```

## 💡 Best Practices & Lessons Learned

1. **Always maintain a backup** of configuration files before making changes
2. **Test changes in a non-production environment** first
3. **Keep a secondary SSH session open** when making SSH configuration changes
4. **Consider using SSH key pairs** instead of password authentication
5. **Regularly monitor auth logs** for suspicious login attempts:
   ```bash
   sudo tail -f /var/log/auth.log
   ```
6. **Use fail2ban** to automatically block brute force attempts
7. **Document all changes** in your system documentation

## 🔍 Additional Security Recommendations

- Disable password authentication (use SSH keys only)
- Change default SSH port (reduces automated attacks)
- Implement two-factor authentication
- Set up rate limiting for SSH connections
- Regularly update SSH server software
- Monitor and review SSH access logs
- Consider using a VPN for server access instead of exposing SSH to the internet
# Notes – Day 4 Task 4

## 🔍 Why Give Executable Permissions?
- Without `x` permission, a shell script cannot be run directly.
- World-executable (`a+x`) ensures any user on the system can run the script without changing ownership.

## ✅ Steps Taken
1. Verified script location with `ls -l /tmp/xfusioncorp.sh`
2. Granted execute permissions using:
   ```bash
   chmod a+x /tmp/xfusioncorp.sh
```
3. Confirmed with:
   ```bash
   ls -l /tmp/xfusioncorp.sh
  
