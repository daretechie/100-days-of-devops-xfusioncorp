# Day 25 – Git Branch, Commit, Merge & Push (Nautilus Project)

## 🔧 Task

The Nautilus application development team is working on `/opt/media.git` repository, which is cloned at `/usr/src/kodekloudrepos/media` on the Storage Server.

They require the following steps:

1. Create a new branch `devops` from `master`.
2. Copy `/tmp/index.html` into the repo.
3. Add & commit this file in the new branch.
4. Merge the branch back into `master`.
5. Push both branches (`master` and `devops`) to origin.

## 🖥️ Target Server

- Hostname: `ststor01.stratos.xfusioncorp.com`
- IP: `172.16.238.15`
- User: `natasha`
- Password: `Bl@kW`

## 📌 Notes

This is a standard Git workflow task—branch creation, committing changes, merging, and pushing to remote. No code modifications beyond adding `index.html`.

````

---

## 🔁 manage_repo.sh

```bash

````

---

## 📘 notes.md

````markdown


````

---

## 🚀 Git Commands
```bash
git add day25-git-branch-merge
git commit -m "Day 25 Task 25: Created devops branch, added index.html, merged to master and pushed to origin"
git push
````

---

👉 Do you want me to also include a **troubleshooting tips** section (like what to do if `push` is rejected or merge conflicts happen) in the `notes.md`?
