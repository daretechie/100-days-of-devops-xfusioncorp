# Notes: Understanding `git rebase`

## What is `git rebase`?

`git rebase` is a command that integrates changes from one branch onto another. It works by moving or "replaying" the commits from your feature branch on top of the latest commits from the target branch (e.g., `master` or `main`).

The primary goal of rebasing is to maintain a clean and linear project history.

## Rebase vs. Merge

To understand the benefit of rebasing, let's compare it with merging.

### `git merge`

Creates a "merge commit" to tie the two histories together. This results in a graph-like history.

```
      A---B---C feature
     /         \
D---E---F---G---H master
```

### `git rebase`

Re-applies your feature branch commits on top of the target branch. This results in a straight, linear history.

```
                  A'--B'--C' feature
                 /
D---E---F---G--- master
```
*(A', B', C' are the rebased commits)*

A linear history is easier to read, navigate, and understand.

## Step-by-Step Rebase Workflow

Here’s how to rebase your feature branch to incorporate the latest changes from `master`.

1.  **Fetch the latest changes** from the remote repository:
    ```bash
    git fetch origin
    ```

2.  **Switch to your feature branch:**
    ```bash
    git checkout feature-branch
    ```

3.  **Start the rebase process:**
    ```bash
    git rebase origin/master
    ```
    This command tells Git to take all the commits on `feature-branch` that are not on `origin/master`, replay them on top of `origin/master`, and move the `feature-branch` pointer to the new tip.

4.  **Handle Conflicts (If any):**
    If you encounter conflicts, Git will pause the rebase.
    -   Open the conflicting files and resolve the issues.
    -   Stage the resolved files with `git add .`.
    -   Continue the rebase with `git rebase --continue`.
    -   To abort the rebase, use `git rebase --abort`.

5.  **Push the Rebased Branch:**
    Because the commit history has been rewritten, you must use a force push. It is highly recommended to use `--force-with-lease` as a safety measure.

    ```bash
    git push origin feature-branch --force-with-lease
    ```

## Important Safeguards

-   **NEVER rebase a public or shared branch** (like `master`, `main`, or a shared `develop` branch). Rebasing rewrites history, which can cause severe problems for collaborators who have pulled the original version of the branch.
-   **Always use `--force-with-lease` instead of `-f` or `--force`**. This option ensures you only force-push if the remote branch is in the state you expect it to be, preventing you from accidentally overwriting work that others may have pushed.

## Key Takeaways

-   Rebasing is best for keeping your private, in-progress feature branches updated with the main branch.
-   It results in a cleaner project history than merging.
-   Rebasing rewrites commit history, so use it with caution, especially when working in a team.