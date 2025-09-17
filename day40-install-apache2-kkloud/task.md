# Day 40 – Install & Configure Apache2 on kkloud Container (xFusionCorp)

## 🔧 Task

One of the Nautilus DevOps team members was working to configure services on a `kkloud` container that is running on **App Server 3** in Stratos Datacenter. Due to PTO, we must complete the work.

**Requirements:**

- Install `apache2` inside the `kkloud` container using `apt`.
- Configure Apache to listen on **port 5004** instead of default port 80.
- Do not bind Apache to a specific IP; it must listen on all (localhost, 127.0.0.1, container IP, etc.).
- Ensure the Apache service is running inside the container and leave the container running.

## 🖥️ Target Server

- Hostname: `stapp03.stratos.xfusioncorp.com`
- IP: `172.16.238.12`
- User: `banner`
- Password: `BigGr33n`

## 📌 Notes

We run everything from the **App Server 3 host**; container name is `kkloud`. Script uses `docker exec` for automation.
