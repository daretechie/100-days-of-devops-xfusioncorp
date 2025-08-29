# Day 21 – Create Bare Git Repository (xFusionCorp)

## 🔧 Task

The Nautilus development team needs a Git repository set up for a new application development project.  
As the DevOps team, we must create the repo on the **Storage Server**.

**Requirements:**

- Install `git` via `yum`.
- Create a **bare repository** named `/opt/media.git` (exact name required).

## 🖥️ Target Server

- Hostname: ststor01.stratos.xfusioncorp.com
- IP: 172.16.238.15
- User: natasha
- Password: Bl@kW

## 📌 Notes

A _bare repository_ is required since developers will be pushing and pulling code, not editing directly on the server.
