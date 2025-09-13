# Day 37 – Copy Encrypted File into Container (xFusionCorp)

## 🔧 Task

The Nautilus DevOps team possesses confidential data on App Server 1 in the Stratos Datacenter.  
A container named `ubuntu_latest` is running on the same server.

**Requirements:**

- Copy the encrypted file `/tmp/nautilus.txt.gpg` from the docker host into the container.
- Target location inside the container: `/usr/src/`.
- Ensure the file remains unmodified (copy as-is).

## 🖥️ Target Server

- Hostname: stapp01.stratos.xfusioncorp.com
- IP: 172.16.238.10
- User: tony
- Password: Ir0nM@n

## 📌 Notes

- Do not attempt to decrypt or modify the file.
- File should remain exactly the same (bit-for-bit copy).

git add day37-copy-encrypted-file
git commit -m "Day 37 Task 37: Copied encrypted file into ubuntu_latest container"
git push

```

```
