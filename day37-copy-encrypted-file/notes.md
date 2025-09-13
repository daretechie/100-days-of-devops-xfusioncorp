# Day 37: Copying Files into a Docker Container

## Task Overview

The task for Day 37 was to securely copy an encrypted file from the host system (App Server 1) into a running Docker container (`ubuntu_latest`). This is a common requirement for delivering configuration, secrets, or data to a containerized application.

**Key Requirements:**
- **Source File:** `/tmp/nautilus.txt.gpg` on the host.
- **Destination Container:** `ubuntu_latest`
- **Destination Path:** `/usr/src/` inside the container.
- **Constraint:** The file must be copied as-is, without any modification.

## Execution and Commands

The `docker cp` command is the standard and most direct way to copy files and directories between a host and a container.

### Command Used

```bash
# Copy the encrypted file from the host to the container
sudo docker cp /tmp/nautilus.txt.gpg ubuntu_latest:/usr/src/
```

- `sudo`: Required to run Docker commands.
- `docker cp`: The command for copying files/directories.
- `/tmp/nautilus.txt.gpg`: The source path on the host.
- `ubuntu_latest:/usr/src/`: The destination, specified as `<container_name>:<path_in_container>`.

## Verification

After copying the file, it's crucial to verify that the operation was successful. This was done by executing a command inside the container using `docker exec`.

### Command Used

```bash
# List the contents of the destination directory inside the container
sudo docker exec ubuntu_latest ls -l /usr/src/
```

- `docker exec`: Executes a command inside a running container.
- `ubuntu_latest`: The name of the target container.
- `ls -l /usr/src/`: The command to run inside the container, which lists the files in the destination directory.

The output of this command should show `nautilus.txt.gpg` in the file listing, confirming the copy was successful.

## Lessons Learned and Best Practices

- **`docker cp` for One-Time Transfers:** `docker cp` is ideal for ad-hoc or one-time file transfers. For persistent or shared data, Docker volumes are a better solution.
- **Syntax:** The syntax is similar to the standard `scp` or `cp` commands, with the container name and path separated by a colon (`:`).
- **Integrity:** `docker cp` performs a bit-for-bit copy, ensuring that the file's content and permissions are preserved, which was a key requirement of this task.
- **Verification is Essential:** Always verify file transfers to or from containers to ensure the application has the data it needs. `docker exec` is a powerful tool for this, allowing you to run any command inside the container to check its state.

This task highlights a fundamental Docker skill: moving data between the host and isolated container environments.