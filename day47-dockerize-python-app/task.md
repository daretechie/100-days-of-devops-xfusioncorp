# Day 47 – Dockerize Python App (xFusionCorp)

## 🔧 Task

A Python app needs to be Dockerized and deployed on App Server 2.

**Requirements:**

- Create a `Dockerfile` under `/python_app`.
- Base image: any official Python image.
- Install dependencies from `requirements.txt` (found under `/python_app/src/`).
- Expose port `3000`.
- Run `server.py` using CMD.
- Build image: `nautilus/python-app`.
- Create container: `pythonapp_nautilus`.
- Map host port `8094` → container port `3000`.

## 🖥️ Target Server

- Hostname: `stapp02.stratos.xfusioncorp.com`
- IP: `172.16.238.11`
- User: `banner`
- Password: `BigGr33n`

## 📌 Notes

After deployment you should be able to test with:

```bash
curl http://localhost:8094/
```
