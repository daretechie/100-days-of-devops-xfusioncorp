#!/bin/bash
# Day 34 Task 34 – Setup Git Post-Update Hook

HOOK_PATH="/opt/games.git/hooks/post-update"

# Create post-update hook
sudo tee $HOOK_PATH > /dev/null <<'EOF'
#!/bin/bash
# Git post-update hook to auto-create release tag on master

while read oldrev newrev ref
do
  branch=$(echo $ref | cut -d/ -f3)
  if [ "$branch" = "master" ]; then
    TODAY=$(date +%F)
    TAG="release-$TODAY"
    git tag "$TAG" "$newrev"
    git push origin "$TAG"
  fi
done
EOF

# Make it executable
sudo chmod +x $HOOK_PATH

# Merge feature into master (from working repo)
cd /usr/src/kodekloudrepos/games || exit
sudo git checkout master
sudo git pull origin master
sudo git merge feature

# Push changes to trigger hook
sudo git push origin master

# Verify tags
sudo git fetch --tags
sudo git tag -l