# Notes – Day 1

## 🔍 Why Create Custom Apache Users?

- **Security:** Isolates each app’s process with its own user.
- **Auditability:** Easier to track changes and logs per app.
- **Best Practice:** Avoids using generic users like `www-data`.

## ✅ Task Review

- Used `useradd -u 1631 -d /var/www/mariyam -m mariyam`
- Verified with `id mariyam` and checked home directory with `ls -ld /var/www/mariyam`

## 💡 Lesson

Always double-check:

- That the UID is not already in use: `getent passwd 1631`
- That the home directory is created properly.
