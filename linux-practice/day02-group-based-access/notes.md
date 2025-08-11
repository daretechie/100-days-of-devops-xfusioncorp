# Notes – Day 2: Group-Based Access Control

## 🔍 Understanding Group-Based Access Control (GBAC)

### Core Principles:
- **Centralized Management**: Apply permissions to groups, not individual users
- **Simplified Administration**: Update access for multiple users at once
- **Principle of Least Privilege**: Grant only necessary permissions
- **Audit Trail**: Clear visibility into access rights

## 🛠️ Implementation Details

### Commands Used
```bash
# Create the group
sudo groupadd nautilus_noc

# Add user to group (preserving existing groups)
sudo usermod -aG nautilus_noc jarod
```

### Command Breakdown:
- `groupadd`: Creates a new group
- `usermod -aG`: Adds user to a group while preserving existing memberships
- `nautilus_noc`: The group name
- `jarod`: The username being added to the group

### Verification Steps
```bash
# Check group exists
getent group nautilus_noc

# Verify user group membership
id jarod

# List all members of a group
getent group nautilus_noc | cut -d: -f4
```

## 🔒 Security Best Practices

1. **Group Naming Conventions**
   - Use descriptive, meaningful names
   - Consider prefixing with project/team name (e.g., `nautilus_`)
   - Document group purposes and access levels

2. **Membership Management**
   - Always use `-aG` (append) with `usermod` to avoid removing existing group memberships
   - Regularly audit group memberships
   - Remove users from groups when access is no longer needed

3. **File Permissions**
   - Set group ownership: `chgrp nautilus_noc /path/to/resource`
   - Set group permissions: `chmod g+rw /path/to/resource`
   - Consider setting setgid bit for directories: `chmod g+s /path/to/directory`

## 🚀 Advanced Group Management

### Create a New User and Add to Group
```bash
# Single command to create user and add to group
sudo useradd -G nautilus_noc newuser

# Set password
sudo passwd newuser
```

### View All Groups a User Belongs To
```bash
groups jarod
# or
id -nG jarod
```

### Remove User from Group
```bash
# Using gpasswd (recommended)
sudo gpasswd -d jarod nautilus_noc

# Or using usermod (more complex)
sudo usermod -G $(id -G jarod | tr ' ' ',' | sed 's/\<nautilus_noc\>//g') jarod
```

## ⚠️ Common Pitfalls
- Using `usermod -G` without `-a` (overwrites all group memberships)
- Forgetting to set appropriate file permissions after creating groups
- Not documenting group purposes and access requirements
- Allowing excessive group memberships that violate least privilege
