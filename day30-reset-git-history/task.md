# Day 30 – Reset Git History for Cluster Repository (xFusionCorp)

## 🔧 Task

The Nautilus development team has been testing inside the **/usr/src/kodekloudrepos/cluster** repository.  
They want to clean this repository and reset commit history, keeping only:

1. **initial commit**
2. **add data.txt file**

All other test commits should be removed.

Finally, push the changes back to origin so that the repo reflects only those two commits.

---

## 🖥️ Target Server

- Hostname: ststor01.stratos.xfusioncorp.com
- Path to repo: `/usr/src/kodekloudrepos/cluster`

---

## 📌 Notes

The goal is to clean the repository history and ensure the final state has **only two commits**.  
This involves rewriting history, so changes will require a **force push**.
