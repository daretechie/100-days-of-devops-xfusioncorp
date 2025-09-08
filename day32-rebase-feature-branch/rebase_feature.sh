#!/bin/bash
# Day 32 Task 32 - Rebase feature branch with master

cd /usr/src/kodekloudrepos/official || exit 1

# Ensure repo is clean
git status

# Checkout feature branch
git checkout feature

# Fetch latest updates
git fetch origin

# Rebase feature with master
git rebase origin/master

# Resolve any conflicts manually if needed, then continue:
# git add <file>
# git rebase --continue

# Push rebased branch to origin
git push origin feature --force-with-lease
