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
