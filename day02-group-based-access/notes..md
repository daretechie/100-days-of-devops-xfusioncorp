# Notes – Day 2

## 🧠 Why Group-Based Access?

- Centralizes access policies across multiple users
- Easier to revoke/grant permissions (just manage group membership)
- Enables **principle of least privilege**

## 🔧 What I Did

- Created `nautilus_noc` group using `groupadd`
- Ensured `jarod` user existed (created if missing)
- Added `jarod` to the group with `usermod -aG`

## 🔎 Verification Commands

```bash
getent group nautilus_noc
id jarod
```

## 💡 Key Lesson

Always check existence before creating users/groups to avoid errors.

Use usermod -aG instead of -G to avoid overwriting other group memberships.
