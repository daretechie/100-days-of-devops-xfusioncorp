# Day 8 – Install Ansible 4.7.0 on Jump Host (xFusionCorp)

## 🔧 Task

The Nautilus DevOps team wants to test automation with Ansible.  
We will install **Ansible version 4.7.0** on the Jump Host using `pip3` only.

**Requirements:**

- Installation must use `pip3` (not OS package managers).
- Ansible version: **4.7.0**
- The `ansible` command must be available system-wide for **all users**.

## 🖥️ Target Server

- Hostname: `jump_host.stratos.xfusioncorp.com`
- IP: _(internal lab-provided)_
- User: `thor`

## 📌 Notes

- Installing via `pip3` ensures version control and easy upgrades.
- Making it available globally means installing to a location in the system `$PATH` accessible by all users.
