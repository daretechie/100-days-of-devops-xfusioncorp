# Notes – Day 10: Automating Website Backups

## 🚀 Backup Strategy Overview

Automating website backups is a critical DevOps practice that ensures data integrity, reduces manual effort, and minimizes the risk of human error. This task implements a robust backup strategy by creating a compressed archive of the website files and storing it in two separate locations, following the 3-2-1 backup rule (3 copies, 2 different media, 1 off-site).

## 📋 Prerequisites

For the backup script to function correctly, the following prerequisites must be met:

- **Passwordless SSH Access**: The script uses `scp` to transfer the backup to a remote server. Passwordless SSH authentication must be configured from the source server to the Nautilus Backup Server (`stbkp01.stratos.xfusioncorp.com`) for the `tony` user. This can be set up using `ssh-copy-id`.

## 🛠️ Backup Script Breakdown

The backup process consists of three main steps:

1.  **Create a Compressed Archive**: The script uses the `zip -r` command to create a recursive, compressed archive of the website's files. This reduces the backup's file size, making it easier to store and transfer.

2.  **Local Storage**: The newly created archive is stored locally in the `/backup/` directory on the source server. This provides a quick and easy way to restore the website in case of a minor issue.

3.  **Remote Storage**: The script then copies the archive to the Nautilus Backup Server using `scp`. This ensures that a copy of the backup is stored in a separate, remote location, protecting it from a catastrophic failure of the source server.

## 💡 Best Practices & Considerations

- **Test Your Backups**: A backup is only useful if it can be successfully restored. Regularly test your backups to ensure their integrity and to familiarize yourself with the restoration process.
- **Secure Your Backups**: Encrypt your backup files to protect them from unauthorized access, especially when storing them in the cloud or on a remote server.
- **Implement a Retention Policy**: Decide how long you need to keep your backups and implement a policy to automatically delete old backups. This will prevent your storage from filling up with unnecessary files.
- **Monitor Your Backup Process**: Set up monitoring to alert you if the backup script fails to run or if any errors occur during the backup process.
- **Backup Your Database**: This script only backs up the website files. For a complete backup, you should also back up your website's database. This can be done using tools like `mysqldump`.