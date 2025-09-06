#!/bin/bash
# Day 30 Task 30 - Reset Git history to only 2 commits

cd /usr/src/kodekloudrepos/cluster || exit 1

# Find the commit hash for "add data.txt file"
COMMIT_HASH=$(git log --grep="add data.txt file" --format="%H" | head -n 1)

# Reset back to initial commit
git reset --hard $(git rev-list --max-parents=0 HEAD)

# Cherry-pick the commit that added data.txt file
git cherry-pick "$COMMIT_HASH"

# Force push cleaned history
git push origin master --force