#!/bin/bash
# Day 10 Task 10 - Website backup automation

# Variables
SOURCE_DIR="/var/www/html/news"
BACKUP_DIR="/backup"
ARCHIVE_NAME="xfusioncorp_news.zip"
REMOTE_USER="clint"
REMOTE_HOST="stbkp01.stratos.xfusioncorp.com"
REMOTE_DIR="/backup"

# Create local backup
echo "Creating backup archive..."
zip -r "${BACKUP_DIR}/${ARCHIVE_NAME}" "$SOURCE_DIR"

# Copy to Nautilus Backup Server (passwordless expected)
echo "Copying backup to Nautilus Backup Server..."
scp "${BACKUP_DIR}/${ARCHIVE_NAME}" ${REMOTE_USER}@${REMOTE_HOST}:${REMOTE_DIR}/

# Exit status check
if [ $? -eq 0 ]; then
  echo "Backup completed successfully!"
else
  echo "Backup failed!"
  exit 1
fi
