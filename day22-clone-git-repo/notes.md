# Notes – Day 22 Task 22

## 🔍 Why This Task?

- Developers need local access to a Git repo copy for testing/building.
- Cloning from `/opt/news.git` ensures they use the latest initialized repo.
- Keeping repo untouched guarantees integrity for future workflows.

## ✅ Command Used

```bash
sudo git clone /opt/news.git /usr/src/kodekloudrepos
```

```

## 💡 Lessons Learned

- Always `mkdir -p` the destination directory to avoid errors.
- `git clone` copies a repo (with history) into a working directory.
- If `bare` repo is cloned, working copy will look empty until files are committed.
```
