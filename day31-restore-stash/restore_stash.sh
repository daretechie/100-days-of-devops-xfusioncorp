#!/bin/bash
# Day 31 Task 31 - Restore stash@{1} in blog repo

cd /usr/src/kodekloudrepos/blog || exit 1

# List stashes (for verification)
git stash list

# Apply stash@{1}
git stash apply stash@{1}

# Stage all changes
git add .

# Commit with a meaningful message
git commit -m "Restored changes from stash@{1}"

# Push to origin
git push origin master
