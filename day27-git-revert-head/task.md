# Day 27 – Revert Latest Commit in Games Repo (xFusionCorp)

## 🔧 Task

The Nautilus app dev team reported an issue with the **latest commit** in the `games` repo.  
We need to revert the **HEAD commit** to the **previous commit (initial commit hash)**.

**Requirements:**

- Repository path: `/usr/src/kodekloudrepos/games`
- Revert the latest commit (HEAD)
- Commit message must be: `revert games` (all lowercase)

## 🖥️ Target Server

- **Storage Server**
  - Hostname: `ststor01.stratos.xfusioncorp.com`
  - IP: `172.16.238.15`
  - User: `natasha`
  - Password: `Bl@kW`

## 📌 Notes

- Do not delete history (`reset` not allowed).
- Must create a new commit with revert applied.
