# Day 4 – Grant Executable Permissions to Backup Script (xFusionCorp)

## 🔧 Task
The sysadmin team has created a new bash script `xfusioncorp.sh` to automate backups.  
The script is already present on **App Server 1**, but it lacks executable permissions.

**Your job:**
- Grant executable permissions to `/tmp/xfusioncorp.sh`
- Ensure **all users** can execute it (world-executable).

## 🖥️ Target Server
- Hostname: `stapp01.stratos.xfusioncorp.com`
- Location of script: `/tmp/xfusioncorp.sh`

## 📌 Requirements
- File must be executable by:
  - Owner
  - Group
  - Others
