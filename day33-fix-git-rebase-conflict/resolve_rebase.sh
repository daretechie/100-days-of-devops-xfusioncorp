#!/bin/bash
# Day 30 Task 30 - Resolve Git rebase conflict

FILE="story-index.txt"

echo "Resolving rebase conflict in $FILE..."

# Step 1: Backup current file
cp "$FILE" "$FILE.bak"

# Step 2: Overwrite with final intended content
cat > "$FILE" <<EOL
1. The Lion and the Mouse
2. The Frogs and the Ox
3. The Fox and the Grapes
4. The Donkey and the Dog
EOL

# Step 3: Mark conflict as resolved
git add "$FILE"

# Step 4: Continue the rebase
git rebase --continue

# Step 5: Verify status
git status
