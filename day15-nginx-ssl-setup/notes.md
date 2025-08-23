# Notes – Day 15 Task 15

## 🔍 Troubleshooting & Steps Taken

1. Installed nginx:

```

sudo yum install -y nginx

```

2. Moved SSL certs:

```

sudo mv /tmp/nautilus.crt /etc/nginx/ssl/nautilus.crt
sudo mv /tmp/nautilus.key /etc/nginx/ssl/nautilus.key

```

3. Created custom SSL config under `/etc/nginx/conf.d/ssl.conf`.
4. Added a simple index.html file with content `Welcome!`.
5. Restarted nginx:

```

sudo systemctl restart nginx

```

## ✅ Verification

- Confirmed service:

```

systemctl status nginx

```

- Confirmed listening on 443:

```

sudo netstat -tulnp | grep nginx

```

- From jumphost:

```

curl -Ik [https://stapp02](https://stapp02)

```

→ Output:

```

HTTP/1.1 200 OK

```

## 💡 Lesson Learned

- SSL certs should be stored securely under `/etc/nginx/ssl`.
- Always test using `curl -Ik` to confirm both SSL and web content.
- Keeping index.html simple helps verify deployment quickly.

```

```
