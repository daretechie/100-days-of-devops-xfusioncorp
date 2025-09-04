# Day 28 – Cherry-pick Specific Commit from Feature to Master (xFusionCorp)

## 🔧 Task

The Nautilus team has two branches in `/usr/src/kodekloudrepos/demo`:

- `master`
- `feature`

A developer is still working on `feature`, but they want **only one commit** merged into `master`.

**Requirements:**

- Commit message to cherry-pick: `Update info.txt`
- Do not merge the entire branch, just that commit.
- Push the updated master branch to the remote repo.

## 🖥️ Target Server

- Hostname: `ststor01.stratos.xfusioncorp.com`
- Repo path: `/usr/src/kodekloudrepos/demo`

## 📌 Notes

Use `git log --oneline` on `feature` branch to identify the correct commit hash for the commit message `Update info.txt`.
