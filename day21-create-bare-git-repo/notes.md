# Day 21: Create Bare Git Repository

This note provides a comprehensive guide on creating a bare Git repository, a crucial component for setting up a centralized version control system. This method is particularly useful for collaboration among developers, allowing them to push and pull changes from a shared repository.

## Key Terminologies

- **Git:** A distributed version control system for tracking changes in source code during software development.
- **Repository (Repo):** A directory where Git stores all the files, history, and metadata for a project.
- **Bare Repository:** A Git repository that does not have a working directory. It is used as a remote repository for sharing code among developers. It only contains the version control information and not the actual source files.
- **Working Directory:** The directory on your local machine that contains the actual files of your project.

## Task Overview

The main objective of this task is to create a bare Git repository named `media.git` on the `ststor01` server. This repository will serve as a central hub for a project, enabling multiple developers to collaborate effectively.

## Implementation Steps

1. **Install Git:**
   The first step is to install Git on the server if it's not already installed.

   ```bash
   yum install -y git
   ```

2. **SSH into the Storage Server:**
   Next, securely connect to the storage server (`ststor01`) using SSH. This is where the bare repository will be hosted.

   ```bash
   ssh natasha@ststor01.stratos.xfusioncorp.com
   ```

3. **Create the Bare Repository:**
   Once connected to the server, the `git init --bare` command is used to create a new bare repository. The `--bare` flag is essential as it initializes a repository without a working directory, making it suitable for a centralized server.

   ```bash
   git init --bare /opt/media.git
   ```

   This command creates a new directory named `media.git` inside `/opt/`, which will contain all the Git version control data.

## Verification

After creating the repository, you can verify its existence by listing the contents of the `/opt` directory. You should see the `media.git` directory.

```bash
ls -l /opt
```

## Cloning the Repository

Once the bare repository is set up, developers can clone it to their local machines to start working on the project.

```bash
git clone natasha@ststor01.stratos.xfusioncorp.com:/opt/media.git
```

This command creates a local copy of the repository, including a working directory with the project files. Developers can then make changes, commit them, and push them back to the central repository.

## Conclusion

Creating a bare Git repository is a fundamental skill for any DevOps engineer or developer. It is the first step towards building a robust and collaborative development environment. By following the steps outlined in this note, you can easily set up a centralized Git repository for your projects.