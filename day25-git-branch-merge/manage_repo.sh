#!/bin/bash
# Day 25 Task 25 - Git Branch, Commit, Merge & Push

REPO_PATH="/usr/src/kodekloudrepos/media"
FILE_TO_COPY="/tmp/index.html"

# Step 1: Move to repo
cd "$REPO_PATH" || exit 1

# Step 2: Create and switch to devops branch
sudo git checkout -b devops

# Step 3: Copy file into repo
sudo cp "$FILE_TO_COPY" "$REPO_PATH/"

# Step 4: Add and commit
sudo git add index.html
sudo git commit -m "Added index.html to devops branch"

# Step 5: Switch back to master
sudo git checkout master

# Step 6: Merge devops into master
sudo git merge devops -m "Merged devops branch into master"

# Step 7: Push both branches
sudo git push origin master
sudo git push origin devops