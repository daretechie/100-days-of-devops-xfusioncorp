#!/bin/bash
# Day 27 Task 27 - Revert latest commit in /usr/src/kodekloudrepos/games

cd /usr/src/kodekloudrepos/games || exit 1

# Configure git user (if not set)
git config user.name "kodekloud"
git config user.email "kodekloud@example.com"

# Revert the latest commit (HEAD) and set commit message
git revert HEAD --no-edit -m 1 || git revert HEAD --no-edit
git commit --amend -m "revert games"

# Verify log
git log --oneline -n 3