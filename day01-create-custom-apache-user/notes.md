# Notes – Day 1: Custom Apache User Creation

## 🔍 Understanding Custom Apache Users

### Why Use Custom Users for Web Services?
- **Security Isolation**: Each application runs with its own user context
- **Resource Tracking**: Monitor resource usage per application
- **Access Control**: Granular file permissions for different applications
- **Compliance**: Meets security best practices and audit requirements

## 🛠️ Implementation Details

### Command Used
```bash
sudo useradd -u 1631 -d /var/www/mariyam -m mariyam
```

### Command Breakdown:
- `useradd`: Creates a new user account
- `-u 1631`: Specifies the User ID (UID)
- `-d /var/www/mariyam`: Sets the home directory
- `-m`: Creates the home directory if it doesn't exist
- `mariyam`: The username

### Verification Steps
```bash
# Verify user creation
id mariyam

# Check home directory
ls -ld /var/www/mariyam

# Verify UID is not in use
getent passwd 1631
```

## 🔒 Security Considerations

1. **UID Selection**
   - Use UIDs above 1000 for regular users
   - Avoid using system UIDs (typically below 1000)
   - Document UID assignments

2. **Home Directory**
   - Place web content in standard locations (/var/www/)
   - Set appropriate permissions (typically 755 for directories, 644 for files)
   - Consider using `chmod g+s` for shared group directories

3. **Group Management**
   - Add user to appropriate groups (e.g., `www-data` for web server access)
   - Use `usermod -aG` to append to existing groups

## 🚀 Best Practices

### Before Creation
```bash
# Check if UID is available
getent passwd 1631

# Verify username doesn't exist
id mariyam 2>/dev/null || echo "User does not exist"
```

### After Creation
```bash
# Set a secure password
sudo passwd mariyam

# Verify user can access their home directory
sudo -u mariyam ls -la ~mariyam
```

## ⚠️ Common Pitfalls
- Forgetting to set a password for the user
- Incorrect permissions on the home directory
- Not adding the user to necessary groups for service access
