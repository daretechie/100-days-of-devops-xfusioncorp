# Notes – Day 25 Task 25

## 🔍 Why This Workflow?

- New features are tested on a dedicated branch (`devops`).
- Merging ensures master remains the source of truth.
- Pushing both branches keeps origin updated for collaboration.

## ✅ Commands Used

```bash
git checkout -b devops
cp /tmp/index.html .
git add index.html
git commit -m "Added index.html to devops branch"
git checkout master
git merge devops
git push origin master
git push origin devops
```

```

## 💡 Lessons Learned

- Always use `-b` with `checkout` to create and switch to a new branch.
- Pushing both `master` and the feature branch ensures remote stays in sync.
- Merge commit messages help track history clearly.
```
