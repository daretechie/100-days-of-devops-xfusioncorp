# Notes – Day 34 Task 34

## 🔍 Why Use a Git Hook?

- Automates release tagging without manual intervention.
- Ensures consistent naming convention (`release-YYYY-MM-DD`).
- Reduces human error in tagging process.

## ✅ Key Commands & Hook Logic

This section outlines the manual Git commands that trigger the hook and the hook's script that automates release tagging.

### Manual Git Workflow

These are the commands a developer would run to merge a feature branch into `master` and push to the remote repository. The `git push` command is what triggers the `post-update` hook on the remote (bare) repository.

```bash
git checkout master
git merge feature
git push origin master
```

### Post-Update Hook Script

This script resides in the `hooks/post-update` file of the bare repository. It automatically creates and pushes a new release tag whenever the `master` branch is updated.

```bash
#!/bin/bash

while read oldrev newrev ref
do
  branch=$(echo $ref | cut -d/ -f3)
  if [ "$branch" = "master" ]; then
    TODAY=$(date +%F)
    git tag "release-$TODAY" "$newrev"
    git push origin "release-$TODAY"
  fi
done
```

## 💡 Lessons Learned

- Bare repos run hooks in a detached HEAD state, so `ref` parsing is safer than `git rev-parse`.
- Always make hooks executable (`chmod +x`).
- Use `git fetch --tags` and `git tag -l` to confirm release tags.

```

```
