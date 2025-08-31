#!/bin/bash
# Day 24 Task 24 - Create new branch from master

REPO_PATH="/usr/src/kodekloudrepos/official"
NEW_BRANCH="xfusioncorp_official"
SOURCE_BRANCH="master"

# Navigate to repo
cd "$REPO_PATH" || { echo "Repo not found!"; exit 1; }

# Ensure repo is clean
git checkout "$SOURCE_BRANCH" || exit 1
git pull origin "$SOURCE_BRANCH"

# Create and push branch
git checkout -b "$NEW_BRANCH"
git push origin "$NEW_BRANCH"

# Verify
git branch -a | grep "$NEW_BRANCH"