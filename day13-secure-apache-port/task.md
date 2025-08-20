# Day 13 – Secure Apache Port with iptables (xFusionCorp)

## 🎯 Objective

The security team has identified a vulnerability: the Apache service on the application servers is running on port `6400`, which is open to all traffic. Your task is to implement a firewall using `iptables` to restrict access to this port according to the requirements below.

## 📋 Requirements

1.  **Install `iptables-services`** on each application server (`stapp01`, `stapp02`, `stapp03`).

2.  **Block incoming port `6400`** on all app servers for everyone **except for the LBR host**.

3.  **Make sure the rules are persistent** and remain active after a system reboot.

## 🖥️ Target Servers

- `stapp01.stratos.xfusioncorp.com` (User: `tony`)
- `stapp02.stratos.xfusioncorp.com` (User: `steve`)
- `stapp03.stratos.xfusioncorp.com` (User: `banner`)

## 📌 Notes

- The final configuration should deny access to port `6400` from any host other than the LBR, including the jump host.
