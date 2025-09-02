#!/bin/bash
# Day 26 Task 26 - Update Git Remote and Push Changes

REPO_PATH="/usr/src/kodekloudrepos/games"
REMOTE_NAME="dev_games"
REMOTE_URL="/opt/xfusioncorp_games.git"
FILE_SRC="/tmp/index.html"
FILE_DEST="$REPO_PATH/index.html"

cd "$REPO_PATH" || exit 1

# Add new remote
git remote add "$REMOTE_NAME" "$REMOTE_URL"

# Copy index.html into repo
cp "$FILE_SRC" "$FILE_DEST"

# Stage and commit file
git add index.html
git commit -m "Day 26 Task 26: Added index.html and updated repo with new remote"

# Push master branch to new remote
git push "$REMOTE_NAME" master