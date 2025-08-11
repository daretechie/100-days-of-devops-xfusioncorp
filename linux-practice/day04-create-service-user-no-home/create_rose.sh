#!/bin/bash

# Day 4 - Create service user with no home directory

USERNAME="rose"

# Create user without home directory
sudo useradd -M "$USERNAME"

# Verify user creation
id "$USERNAME"
getent passwd "$USERNAME"
