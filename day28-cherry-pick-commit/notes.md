# Notes – Day 27 Task 27

## 🔍 Why Revert Instead of Reset?

- `git reset --hard` removes history → unsafe for shared repos.
- `git revert` safely creates a new commit that undoes changes.

## ✅ Commands Used

```bash
cd /usr/src/kodekloudrepos/games
git revert HEAD --no-edit
git commit --amend -m "revert games"
git log --oneline
```

```

## 💡 Lesson Learned

- Always use **revert** in shared repos → preserves commit history.
- `git commit --amend` helps adjust commit messages if required.
```
