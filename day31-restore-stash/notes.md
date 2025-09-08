# Notes: Git Stash Workflow

## What is `git stash`?

`git stash` is a powerful command that temporarily shelves (or stashes) your uncommitted local changes, allowing you to switch contexts and work on other tasks without having to make a premature commit.

## Why Use `git stash`?

You might use `git stash` in several scenarios:

- **Urgent Task:** You're in the middle of a feature, and an urgent bug fix is required on another branch. You can stash your changes, switch to the bug-fix branch, and come back later.
- **Pulling Updates:** You have local modifications, but you need to pull updates from the remote repository. Stashing your changes can prevent potential conflicts during the pull.
- **Switching Branches:** You want to switch to another branch to check something out, but you're not ready to commit your current work.

## Common `git stash` Commands

Here are the most frequently used `git stash` commands:

| Command | Description |
| :--- | :--- |
| `git stash` | Stash your uncommitted changes. |
| `git stash save "message"` | Stash your changes with a descriptive message. |
| `git stash list` | List all your stashes. |
| `git stash apply [stash_id]` | Apply a stash without removing it from the stash list. Defaults to the latest stash (`stash@{0}`). |
| `git stash pop [stash_id]` | Apply a stash and remove it from the stash list. Defaults to the latest stash. |
| `git stash drop [stash_id]` | Delete a stash from the stash list. Defaults to the latest stash. |
| `git stash clear` | Remove all stashes. |

*Note: `[stash_id]` is optional. If not provided, Git assumes the most recent stash (i.e., `stash@{0}`).*

## Example Workflow

1.  **Make changes** to your working directory.
2.  **Stash the changes:**
    ```bash
    git stash save "Working on new feature"
    ```
3.  **Switch to another branch** and do other work.
4.  **Return to your original branch.**
5.  **List your stashes** to find the one you want to restore:
    ```bash
    git stash list
    ```
6.  **Apply the stash:**
    ```bash
    git stash apply stash@{0}
    ```
7.  **Continue working** on your feature. Once you're sure the stashed changes are correctly integrated, you can either drop the stash or clear all stashes.

## Key Takeaways

- `git stash apply` is safer than `git stash pop` because it doesn't delete the stash. You can re-apply it if something goes wrong.
- Always use `git stash list` to see your stashes before you `apply`, `pop`, or `drop`.
- After applying a stash, the changes are unstaged. You'll need to `git add` them before you can commit.
- Stashing is for temporary storage. For long-term changes, use branches.