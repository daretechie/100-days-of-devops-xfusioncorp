# Notes – Day 30 Task 30

## 🔍 Why Reset History?

- Developers pushed several **test commits** that should not remain in production history.
- Resetting + cherry-picking ensures only the **essential commits** are preserved.

## ✅ Commands Used

```bash
# Show commit history
git log --oneline

# Hard reset to first commit
git reset --hard <initial_commit_hash>

# Cherry-pick only the "add data.txt file" commit
git cherry-pick <commit_hash>

# Force push cleaned branch
git push origin master --force
```

```

## 💡 Lessons Learned

- `git reset --hard` rewinds HEAD and working tree to a clean state.
- `git cherry-pick` lets you bring back specific commits into the new history.
- `git push --force` is required after rewriting history.
- Be cautious with `--force` on shared repos; always communicate with teammates first.
```
