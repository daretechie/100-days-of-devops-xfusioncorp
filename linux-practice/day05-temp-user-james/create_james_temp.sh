#!/bin/bash

USERNAME="james"
EXPIRY_DATE="2024-01-28"

# Create user with expiry date
sudo useradd -e $EXPIRY_DATE $USERNAME


# Verify user creation
id $USERNAME