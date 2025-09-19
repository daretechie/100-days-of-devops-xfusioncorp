#!/bin/bash

# Day 42 Task 42 - Create Docker Network 'beta'

NETWORK_NAME="beta"
SUBNET="172.28.0.0/24"
IP_RANGE="172.28.0.0/24"

# Create the network

sudo docker network create \
 --driver bridge \
 --subnet $SUBNET \
 --ip-range $IP_RANGE \
 $NETWORK_NAME

# Verify creation

sudo docker network ls | grep $NETWORK_NAME
sudo docker network inspect $NETWORK_NAME
