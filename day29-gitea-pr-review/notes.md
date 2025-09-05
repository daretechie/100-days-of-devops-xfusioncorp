# Notes – Day 29 Task 29

## ✅ Steps Performed

1. SSH into storage server as max:
   ```bash
   ssh max@<storage-server-ip>
   cd ~/repo-name
   ```

````

2. Confirm repo contents and commit log:

   ```bash
   git log --oneline --author=max
   # Verified commit with message about "Fox and Grapes"
   ```

3. Open Gitea UI from top bar in the lab.

4. Login as **max** and create PR:

   - Source branch: `story/fox-and-grapes`
   - Destination branch: `master`
   - PR Title: `Added fox-and-grapes story`
   - Assign **tom** as reviewer.

5. Logout and login as **tom**:

   - Review PR → Approve → Merge into master.

6. Verified in `master` branch:

   ```bash
   git checkout master
   git pull origin master
   # Fox-and-grapes story now part of master
   ```

## 💡 Lessons Learned

- Direct pushes to master can be restricted by workflow, enforcing code review culture.
- Gitea (like GitHub/GitLab) makes branch protection + review a standard practice.
- PR reviews are critical for collaboration and knowledge sharing.
````
