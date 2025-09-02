# Notes – Day 26 Task 26

## 🔍 Why Update Git Remote?

- To connect the local repo with a new upstream location (`/opt/xfusioncorp_games.git`).
- Useful when migrating repos or setting up additional remotes for collaboration.

## ✅ Commands Used

```bash
cd /usr/src/kodekloudrepos/games
git remote add dev_games /opt/xfusioncorp_games.git
cp /tmp/index.html .
git add index.html
git commit -m "Day 26 Task 26: Added index.html and updated repo with new remote"
git push dev_games master
```

---

## 💡 Lesson Learned

- Git remotes allow one repo to push/pull from multiple sources.
- Always verify remotes with `git remote -v`.
- Pushing to the correct remote ensures code syncs with the intended repo.
