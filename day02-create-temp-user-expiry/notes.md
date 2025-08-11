# Notes – Day 5: Temporary User with Expiry

## 🔍 Understanding Temporary User Accounts

### Key Characteristics:
- Automatically expires on a specified date
- Prevents long-term access without review
- Ideal for time-bound access requirements
- Enhances security by limiting account lifespan

### Common Use Cases:
- Contractor or intern access (30-90 days)
- Temporary project team members (project duration)
- Time-limited system access (e.g., vendor support)
- Audit compliance requirements
- Temporary elevated access requests

## 🛠️ Implementation Details

### Command Used
```bash
# Create user with expiry date
sudo useradd -e 2024-01-28 james

# Alternative: Set expiry for existing user
sudo chage -E 2024-01-28 james
```

### Command Breakdown:
- `useradd`: Creates a new user account
- `-e YYYY-MM-DD`: Sets the account expiration date
- `chage -E`: Modifies account expiry

### Verification Steps
```bash
# Check specific user's expiry
echo "=== Account Expiry Details ==="
sudo chage -l james | grep -E 'Account expires|Last password change'

# Expected output:
# Last password change     : Aug 09, 2025
# Account expires          : Sep 08, 2025

# List all users with expiry dates
sudo chage -l $(getent passwd | cut -d: -f1) 2>/dev/null | grep -E "^[^:]+:|^Account expires"
```

## 🔒 Security Best Practices

1. **Account Management**
   - Always set an expiration date for temporary accounts
   - Document the purpose of the temporary account
   - Include expiration date in the account description
   - Example: `sudo usermod -c "Temporary access - Expires 2024-01-28" james`

2. **Password Policy**
   - Set a strong initial password
   - Consider forcing password change on first login
   - Example: `sudo passwd -e james`

3. **Notification Process**
   - Set calendar reminders before account expiration
   - Notify account owner and manager before expiration
   - Document account review process

## 🚀 Advanced Management

### Extend Expiry Date
```bash
# Extend existing user's expiry
sudo chage -E 2024-02-28 james
```

### Check Expiry Status
```bash
# Days until expiration
expiry_epoch=$(date -d "$(sudo chage -l james | grep 'Account expires' | cut -d: -f2 | xargs)" +%s)
current_epoch=$(date +%s)
echo "Days until expiration: $(( (expiry_epoch - current_epoch) / 86400 ))"
```

### Find Expired Accounts
```bash
# List all expired accounts
sudo chage -l $(getent passwd | cut -d: -f1) 2>/dev/null | grep -B1 "Account expires.*expired" | grep -v "^$"
```

## ⚠️ Common Pitfalls & Solutions

| Pitfall | Solution |
|---------|----------|
| Forgetting to set expiry | Use wrapper scripts that require expiry date |
| No documentation | Enforce GECOS field completion |
| No notifications | Implement automated email alerts |
| Orphaned home dirs | Add cleanup to account removal process |
| No access reviews | Schedule monthly access reviews |

## 🔍 Troubleshooting

### Account Not Expiring
```bash
# Check if account is locked
sudo passwd -S james

# Verify shadow entry
grep james /etc/shadow | cut -d: -f2,8
# Format: password:expiry_days_since_epoch
```

### Expired Account Still Active
```bash
# Force immediate lock
sudo usermod --expiredate 1 james

# Or lock the account
sudo usermod -L james
```

## 📝 Additional Notes
- Expired accounts remain in the system but cannot be used for login
- Consider automating account cleanup for expired temporary users
- Document the business owner for each temporary account
- Regular audits of temporary accounts are recommended
