# Day 31 – Restore Stashed Changes for Blog Repository (xFusionCorp)

## 🔧 Task

The Nautilus development team stashed some in-progress changes in the  
**/usr/src/kodekloudrepos/blog** repository.

They now want to **restore the stashed changes with `stash@{1}`**,  
commit them, and push the final state to the origin.

---

## 🖥️ Target Server

- Hostname: ststor01.stratos.xfusioncorp.com
- Path to repo: `/usr/src/kodekloudrepos/blog`

---

## 📌 Notes

Only the **stash@{1}** entry should be applied, not others.  
The result must be **committed** and **pushed** so it’s available on the remote repo.
