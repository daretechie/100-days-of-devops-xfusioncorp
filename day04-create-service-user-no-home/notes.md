# Notes – Day 4: Create Service User Without Home Directory

## 🎯 Why No Home Directory?

- **Lightweight service account**
- No need for personal file storage or login shell
- Reduces filesystem clutter and potential attack surface

## ✅ Command Used

```bash
sudo useradd -M rose
```

### Command Breakdown:
- `useradd`: Creates a new user account
- `-M`: Tells useradd to not create a home directory
- `rose`: The username for the service account

### Verification Steps
```bash
# Verify user exists
id rose

# Check that no home directory was created
! getent passwd rose | cut -d: -f6 | xargs test -d && echo "No home directory (good)"

# View user's shell
grep rose /etc/passwd
```

## 🔒 Security Best Practices

1. **Account Security**
   - Consider using `-s /sbin/nologin` for non-interactive accounts
   - Set a secure password or lock the account if not needed: `sudo passwd -l rose`
   - Document the purpose of the service account

2. **File System**
   - Ensure any required directories have proper ownership and permissions
   - Use system directories like `/var/lib` for service-specific data
   - Set appropriate umask for any created directories

3. **Process Management**
   - Run services under this user with minimal privileges
   - Consider using systemd's `DynamicUser` when possible
   - Implement proper logging for service activities

## 🔄 Alternative Approaches

### Using `adduser` (Debian/Ubuntu)
```bash
sudo adduser --no-create-home --disabled-login rose
```

### Creating a System User
```bash
sudo useradd -r -s /sbin/nologin rose
```

## ⚠️ Common Pitfalls
- Forgetting to set a proper shell for service accounts
- Not documenting the purpose of the service account
- Accidentally creating a home directory by omitting the `-M` flag
- Not setting proper permissions on service-specific directories
