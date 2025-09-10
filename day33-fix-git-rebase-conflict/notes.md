# Notes – Day 33: Resolving Git Rebase Conflicts

## 🔍 Understanding Rebase Conflicts

Rebase conflicts happen when you try to re-apply your commits on top of a different base, and Git discovers that your changes clash with changes in the new base.

- **What are they?** Conflicts are Git's way of saying it can't automatically decide which code to keep.
- **Conflict Markers:** Git marks the conflicted areas in the file with `<<<<<<<`, `=======`, and `>>>>>>>`. Your job is to edit the file to keep the correct code.
- **Manual Resolution:** You must manually edit the conflicted files to resolve the differences. This ensures the final version is exactly what you want.

## ✅ Resolving Rebase Conflicts: A Step-by-Step Guide

Here is the standard workflow for resolving a rebase conflict:

1.  **Identify the Conflict:**
    When the rebase stops, `git status` will show you which files have conflicts.

2.  **Edit the Conflicted File:**
    Open the conflicted file(s) in your editor and look for the conflict markers. Decide which changes to keep, edit the file to its final desired state, and remove the conflict markers.

    ```bash
    # Open the conflicted file in your editor of choice
    # For example:
    # vi story-index.txt
    # code story-index.txt
    # nano story-index.txt
    ```

3.  **Stage the Resolved File:**
    After you've resolved the conflict and saved the file, you need to tell Git that you're done by staging the file.

    ```bash
    # Mark the conflict as resolved
    git add story-index.txt
    ```

4.  **Continue the Rebase:**
    Once all conflicts are resolved and staged, you can continue the rebase process.

    ```bash
    git rebase --continue
    ```

5.  **Verify the Outcome:**
    After the rebase is complete, it's a good idea to check the status and review the new commit history.

    ```bash
    git status
    git log
    ```

## 💡 Key Takeaways

- **`git status` is your best friend:** It tells you where you are in the rebase process and which files have conflicts.
- **Rebase rewrites history:** Be careful when rebasing branches that others are using. It's best to only rebase your own local feature branches.
- **Don't be afraid to abort:** If you get stuck, you can always undo the rebase with `git rebase --abort`. Your branch will be back to the state it was in before you started.
