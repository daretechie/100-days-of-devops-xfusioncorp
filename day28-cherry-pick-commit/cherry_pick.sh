#!/bin/bash
# Day 28 Task 28 - Cherry-pick commit from feature into master

REPO_PATH="/usr/src/kodekloudrepos/demo"

cd "$REPO_PATH" || exit 1

# Ensure clean working state
git status

# Switch to master branch
git checkout master

# Fetch latest changes from remote (optional safety step)
git fetch origin

# Identify commit hash on feature branch with message "Update info.txt"
COMMIT_HASH=$(git log feature --oneline | grep "Update info.txt" | head -n 1 | awk '{print $1}')

# Cherry-pick that commit into master
git cherry-pick "$COMMIT_HASH"

# Push updated master branch to origin
git push origin master