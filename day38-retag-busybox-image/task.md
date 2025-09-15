# Day 38 – Pull and Re-Tag BusyBox Image (xFusionCorp)

## 🔧 Task

The Nautilus DevOps team needs to test containerized application features.  
On **App Server 1** in Stratos Datacenter:

- Pull the `busybox:musl` Docker image.
- Re-tag (create new tag) this image as `busybox:local`.

## 🖥️ Target Server

- Hostname: stapp01.stratos.xfusioncorp.com
- IP: 172.16.238.10
- User: banner
- Password: BigGr33n

## 📌 Notes

The re-tagging should not alter the image contents, only create a new reference.
