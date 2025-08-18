# Day 11 – Tomcat Deployment for Nautilus Java Application

## 🔧 Task

The dev team has built a beta version of their Java-based application.  
We need to deploy it using **Apache Tomcat** on App Server 2.

**Requirements:**

1. Install Tomcat server on **App Server 2**.
2. Configure it to run on **port 8089**.
3. Copy `ROOT.war` from **Jump Host** (`/tmp/ROOT.war`) to Tomcat’s `webapps` directory.
4. Ensure the application is accessible via:

```bash
curl http://stapp02:8089
```

## 🖥️ Target Server

- Hostname: `stapp02.stratos.xfusioncorp.com`
- IP: `172.16.238.11`
- User: `steve`
- Password: `Am3ric@`

## 📌 Notes

- WAR file must be deployed as `ROOT.war` to serve at the **base URL**.
- Tomcat default webapps path: `/usr/share/tomcat/webapps/` (varies by OS/package).
- Firewall/SELinux must allow port `8089`.
