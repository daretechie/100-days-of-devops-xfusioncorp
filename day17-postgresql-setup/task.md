# Day 17 – PostgreSQL Database & User Setup (xFusionCorp)

## 🔧 Task

The Nautilus application development team plans to deploy a new app that requires PostgreSQL.

**Requirements:**

1. Create a PostgreSQL database user `kodekloud_joy` with password `B4zNgHA7Ya`.
2. Create a database `kodekloud_db6`.
3. Grant full permissions on `kodekloud_db6` to `kodekloud_joy`.

## 🖥️ Target Server

- Hostname: **stdb01.stratos.xfusioncorp.com**
- IP: `172.16.239.10`
- User: **peter**
- Password: `Sp!dy`

## 📌 Notes

- PostgreSQL is already installed, no need to restart the service.
- All commands should be executed as the `postgres` user.

## 🚀 Git Commands

```bash
git add day17-postgresql-setup
git commit -m "Day 17 Task 17: Created PostgreSQL user and database with full permissions"
git push
```
