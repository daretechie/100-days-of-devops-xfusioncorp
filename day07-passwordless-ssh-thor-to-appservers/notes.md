# Day 7 - Configure Password-less SSH from Jump Host to App Servers

## 🔍 Overview
Password-less SSH authentication uses public-key cryptography to enable secure, automated access between servers without manual password entry. This is crucial for:
- Automated deployments and scripts
- CI/CD pipelines
- Remote system administration
- Scheduled backups and monitoring

## 🛠️ Implementation Steps

### 1. Switch to Thor User
```bash
# Switch to thor user (from root)
sudo su - thor
```

### 2. Generate SSH Key Pair
```bash
   ssh-keygen -t rsa -b 4096
```

### 3. Copy Public Key to App Servers
```bash
# Using ssh-copy-id (recommended)
ssh-copy-id tony@stapp01.stratos.xfusioncorp.com
ssh-copy-id steve@stapp02.stratos.xfusioncorp.com
ssh-copy-id banner@stapp03.stratos.xfusioncorp.com

# Alternative manual method if ssh-copy-id is unavailable
# cat ~/.ssh/id_rsa.pub | ssh tony@stapp01.stratos.xfusioncorp.com "mkdir -p ~/.ssh && chmod 700 ~/.ssh && cat >> ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys"
```

### 4. Test Password-less Login
```bash
# Test connection to each server
ssh tony@stapp01.stratos.xfusioncorp.com "echo 'Successfully connected to: '$(hostname)"
ssh steve@stapp02.stratos.xfusioncorp.com "echo 'Successfully connected to: '$(hostname)"
ssh banner@stapp03.stratos.xfusioncorp.com "echo 'Successfully connected to: '$(hostname)"
```

## 🔒 Security Best Practices

### File Permissions
```bash
# On local machine (thor@jump_host)
chmod 700 ~/.ssh
chmod 600 ~/.ssh/id_rsa
chmod 644 ~/.ssh/id_rsa.pub
chmod 644 ~/.ssh/known_hosts

# On remote servers (enforced by ssh-copy-id)
# ~/.ssh = 700
# ~/.ssh/authorized_keys = 600
```

### SSH Config File (Optional but Recommended)
Create or edit `~/.ssh/config` on the jump host:
```
Host stapp01
    HostName stapp01.stratos.xfusioncorp.com
    User tony
    IdentityFile ~/.ssh/id_rsa
    StrictHostKeyChecking no

Host stapp02
    HostName stapp02.stratos.xfusioncorp.com
    User steve
    IdentityFile ~/.ssh/id_rsa
    StrictHostKeyChecking no

Host stapp03
    HostName stapp03.stratos.xfusioncorp.com
    User banner
    IdentityFile ~/.ssh/id_rsa
    StrictHostKeyChecking no
```
Then connect simply with: `ssh stapp01`

## 🚨 Troubleshooting

### Common Issues
1. **Permission Denied (publickey)**
   - Verify `~/.ssh/authorized_keys` permissions (must be 600)
   - Check SELinux context: `restorecon -R -v ~/.ssh`
   - Verify `PubkeyAuthentication yes` in `/etc/ssh/sshd_config`

2. **Connection Refused**
   - Check if SSH service is running: `systemctl status sshd`
   - Verify network connectivity and firewall rules

3. **Host Key Verification Failed**
   - Remove old key: `ssh-keygen -R hostname`
   - Or edit `~/.ssh/known_hosts` to remove the problematic entry

## 📝 Notes

### Key Management
- Rotate SSH keys periodically (recommended every 90 days)
- Use different keys for different environments
- Consider using an SSH agent for added security

### Security Considerations
- Never share private keys
- Use passphrases for additional security in production
- Consider using SSH certificates for large environments

### Automation Script
For automated setups, use this script:
```bash
#!/bin/bash

# Array of servers and users
declare -A SERVERS=(
    [stapp01.stratos.xfusioncorp.com]="tony"
    [stapp02.stratos.xfusioncorp.com]="steve"
    [stapp03.stratos.xfusioncorp.com]="banner"
)

# Generate SSH key if not exists
if [ ! -f ~/.ssh/id_rsa ]; then
    echo "Generating SSH key..."
    ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa -N ""
fi

# Copy keys to each server
for server in "${!SERVERS[@]}"; do
    user="${SERVERS[$server]}"
    echo "Setting up $user@$server..."
    ssh-copy-id -i ~/.ssh/id_rsa.pub "$user@$server"
done

echo "Password-less SSH setup complete!"
```

## 📚 Additional Resources
- [OpenSSH Documentation](https://www.openssh.com/manual.html)
- [SSH Key Management Best Practices](https://www.ssh.com/ssh/key/)
- [SSH Config File Options](https://linux.die.net/man/5/ssh_config)