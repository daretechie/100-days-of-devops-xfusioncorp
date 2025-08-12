# Notes – Day 5: Install and Disable SELinux

## 🔍 Understanding SELinux

### What is SELinux?
- **Security-Enhanced Linux (SELinux)** is a Linux kernel security module that provides a mechanism for supporting access control security policies.
- It implements **Mandatory Access Control (MAC)**, which is more granular than traditional Linux Discretionary Access Control (DAC).

### Key Benefits of SELinux:
- **Process Isolation**: Limits what system services can access
- **Fine-grained Access Control**: Controls access between users, files, and processes
- **Mitigates Exploits**: Contains potential security breaches
- **Policy-based Security**: Enforces security policies that persist across reboots

## 🛠 Implementation Details

### 1. Installing SELinux Packages
```bash
# Install required SELinux packages
sudo yum install -y selinux-policy selinux-policy-targeted policycoreutils

# Verify installation
rpm -qa | grep -E 'selinux|policycoreutils'
```

### 2. Checking SELinux Status
```bash
# Check current SELinux status
sestatus

# Alternative status check
getenforce

# View SELinux context of files and processes
ls -Z /var/www/html/
ps -eZ | grep httpd
```

### 3. Temporarily Changing SELinux Mode
```bash
# Set SELinux to permissive mode (logs but doesn't enforce)
sudo setenforce 0

# Set SELinux to enforcing mode
# sudo setenforce 1

# Verify the change
getenforce
```

### 4. Permanently Configuring SELinux
```bash
# Edit the SELinux configuration file
sudo vi /etc/selinux/config

# Change this line to:
# SELINUX=disabled  # Completely disable (not recommended)
# or
# SELINUX=permissive  # Logs violations without enforcing
# or
# SELINUX=enforcing  # Enforce SELinux policies

# After changing the config, a reboot is required
# sudo reboot
```

## 🔒 Verification Steps

```bash
# Check SELinux status after reboot
sestatus

# View SELinux context of the current user
id -Z

# Check for SELinux denials (useful for troubleshooting)
sudo ausearch -m AVC,USER_AVC -ts recent

# View SELinux boolean values
getsebool -a
```

## 🔄 Troubleshooting Common Issues

### If a Service is Blocked by SELinux:
```bash
# 1. Check audit logs for denials
sudo grep -i "avc: " /var/log/audit/audit.log

# 2. Generate a local policy module (if needed)
# sudo grep -i "avc: " /var/log/audit/audit.log | audit2allow -M mypolicy
# sudo semodule -i mypolicy.pp

# 3. Adjust file contexts if needed
# sudo semanage fcontext -a -t httpd_sys_content_t "/web(/.*)?"
# sudo restorecon -Rv /web
```

## 💡 Best Practices & Recommendations

1. **Don't disable SELinux** unless absolutely necessary
2. Use **permissive mode** for troubleshooting before enforcing
3. **Monitor logs** regularly for SELinux denials
4. Learn basic **semanage** and **setsebool** commands
5. **Label files correctly** when moving them between directories
6. Keep SELinux **policy packages updated**
7. Document any custom SELinux rules or contexts

## ⚠️ Important Notes

- Disabling SELinux reduces system security
- Some applications may require specific SELinux policies
- Always test in staging before changing production systems
- Consider using targeted policy for most use cases
- Remember that changes to `/etc/selinux/config` require a reboot to take effect

## 🔗 Additional Resources
- [SELinux Project Wiki](https://selinuxproject.org/)
- [Red Hat SELinux Documentation](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/using-selinux/)
- [SELinux Cheat Sheet](https://danielmiessler.com/study/selinux/)
