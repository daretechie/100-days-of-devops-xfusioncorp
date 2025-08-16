# Notes – Day 8 Task 8

## 📖 What is Ansible?

Ansible is an open-source IT automation tool that automates provisioning, configuration management, application deployment, orchestration, and many other IT processes. It is simple to use, yet powerful enough to automate complex multi-tier IT application environments.

### ✨ Key Features

- **Agentless**: There is no need to install any agent/software on the client systems.
- **YAML-based Playbooks**: Ansible uses YAML to define automation jobs in a way that is easy for humans to read and understand.
- **Idempotent**: Ansible's operations are idempotent, meaning that running the same playbook multiple times will not have any unintended side effects. If the system is already in the desired state, Ansible will not make any changes.
- **Cross-platform**: It can be used to manage a wide variety of systems, including Linux, Windows, and macOS.

### 🚀 Common Use Cases

- **Configuration Management**: Enforce desired configurations on servers, ensuring consistency.
- **Application Deployment**: Automate the deployment of applications and services.
- **Orchestration**: Coordinate complex workflows, such as rolling updates.
- **Cloud Provisioning**: Provision and manage cloud infrastructure on platforms like AWS, Azure, and Google Cloud.
- **Security and Compliance**: Automate security tasks and enforce security policies across your infrastructure.

## 🔍 Why Install via pip3?

- Allows installation of a **specific version** (4.7.0 in this case).
- Works independently of system package versions.
- Easier upgrades/downgrades than `yum` or `apt`.

## ✅ Steps Taken

1. Installed `python3-pip`:
   ```bash
   sudo yum install -y python3-pip
   ```
2. Installed Ansible 4.7.0:
   ```bash
   sudo pip3 install ansible==4.7.0
   ```
3. Verified with:
   ```bash
   ansible --version
   which ansible
   ```

## ⚠️ Notes

- `sudo` is required so the binary is placed in a location accessible to all users (usually `/usr/local/bin`).
- Without `sudo`, `pip3` would install Ansible only for the current user.

## 💡 Lesson Learned

- Always check `$PATH` after installing CLI tools to confirm accessibility.
- Pinning the version in `pip3 install ansible==<version>` ensures consistent environments across servers.
