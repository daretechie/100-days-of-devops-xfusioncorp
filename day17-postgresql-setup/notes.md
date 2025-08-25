# Notes – Day 17 Task 17: PostgreSQL Database and User Setup

## 📝 Task Summary

The objective was to prepare the PostgreSQL database for a new application. This involved creating a dedicated database user and a new database, and then granting the user full access to that database on the `stdb01` server.

---

## 🔍 Troubleshooting & Steps Taken

1.  **Identify Target Server and Credentials:**
    The first step was to identify the correct server (`stdb01`) and the credentials needed to log in.

2.  **Switch to `postgres` User:**
    PostgreSQL administrative commands must be run by the `postgres` system user. I used `sudo -i -u postgres` to switch to an interactive shell as this user. This is the standard and most reliable way to perform database-level operations.

3.  **Execute SQL Commands:**
    I used a `psql` heredoc to execute all the necessary SQL commands in a single, non-interactive block. This method is efficient and great for scripting.
    -   **Create User:** The `CREATE USER` command was used to create `kodekloud_joy` with its specified password.
    -   **Create Database:** The `CREATE DATABASE` command was used to create `kodekloud_db6`.
    -   **Grant Privileges:** `GRANT ALL PRIVILEGES` was used to give the new user complete control over the new database. This is a critical step, as creating a user does not automatically grant them any permissions.

---

## ✅ Verification

-   **List Users:**
    To confirm the user was created, I listed all PostgreSQL users.
    ```bash
    sudo -i -u postgres psql -c "\du"
    ```

-   **List Databases:**
    To confirm the database was created, I listed all databases.
    ```bash
    sudo -i -u postgres psql -c "\l"
    ```

-   **Test Connection (Crucial Step):**
    The most important verification is to test if the new user can actually connect to the database. This confirms that the user, password, and permissions are all set correctly.
    ```bash
    psql -U kodekloud_joy -d kodekloud_db6 -h localhost -W
    ```
    *(You would be prompted to enter the password `B4zNgHA7Ya`)*

---

## 💡 Lesson Learned

-   **Heredoc for Automation:** Using a `psql` heredoc (`<<EOF ... EOF`) is a powerful way to automate a sequence of SQL commands within a shell script, avoiding the need for multiple `psql -c` calls.
-   **Permissions are Explicit:** In PostgreSQL (and most database systems), permissions must be explicitly granted. A user can exist but have no access to any database until `GRANT` is used.
-   **`sudo -i -u postgres`:** This is the canonical way to switch to the `postgres` user and inherit its environment, ensuring `psql` and other utilities are in the `PATH` and work as expected.

---

## Bash Script (`setup_db.sh`)

Here is the script that automates the entire process:

```bash
#!/bin/bash
# Day 17 Task 17 - PostgreSQL DB & user setup

DB_USER="kodekloud_joy"
DB_PASS="B4zNgHA7Ya"
DB_NAME="kodekloud_db6"

# Switch to postgres user and run SQL commands
sudo -i -u postgres psql <<EOF
-- Create user
CREATE USER $DB_USER WITH PASSWORD '$DB_PASS';

-- Create database
CREATE DATABASE $DB_NAME;

-- Grant privileges
GRANT ALL PRIVILEGES ON DATABASE $DB_NAME TO $DB_USER;
EOF

echo "Database and user setup completed successfully."
```