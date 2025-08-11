# Notes – Day 3: Non-Interactive Service Account

## 🔒 Understanding Non-Interactive Shells

### Key Characteristics:
- Prevents interactive login (SSH, TTY, console)
- Restricts shell access while allowing service execution
- Provides security through the principle of least privilege

### Common Use Cases:
- Service accounts for applications (e.g., backup agents, monitoring tools)
- Automation and scheduled tasks
- System daemons and background processes

## 🛡️ Security Benefits

1. **Reduced Attack Surface**
   - No interactive login capability
   - Limited system access
   - Minimized potential for privilege escalation

2. **Account Isolation**
   - Dedicated user for specific services
   - Better audit trails (actions tied to specific service account)
   - Easier permission management

## 🛠️ Implementation

### Command Used
```bash
sudo useradd -s /usr/sbin/nologin john
```

### Command Breakdown:
- `useradd`: Creates a new user account
- `-s /usr/sbin/nologin`: Sets the login shell to nologin
- `john`: The username for the service account

### Verification:
```bash
# Check user's shell
grep john /etc/passwd

# Verify login attempt (should show "This account is currently not available")
su - john
```

## 🔄 Alternative Shells for Service Accounts

| Shell | Description | Use Case |
|-------|-------------|----------|
| `/usr/sbin/nologin` | Standard nologin shell | Most common for service accounts |
| `/bin/false` | Does nothing, returns false | Simple alternative to nologin |
| `/bin/sync` | Syncs filesystem | Special cases only |

## 🔍 Additional Security Considerations

1. **Home Directory**: Consider using `-M` to prevent home directory creation
2. **Password**: Ensure password is locked with `passwd -l john`
3. **Sudo Access**: Never grant sudo access to service accounts
4. **Monitoring**: Monitor service account activities in system logs
