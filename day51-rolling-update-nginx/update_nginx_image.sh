#!/bin/bash
# Day 51 Task 51 – Rolling update nginx deployment to new image

DEPLOYMENT="nginx-deployment"
CONTAINER_NAME="nginx-container"
NEW_IMAGE="nginx:1.19"

# Perform rolling update
kubectl set image deployment/${DEPLOYMENT} ${CONTAINER_NAME}=${NEW_IMAGE}

# Wait for rollout to complete
kubectl rollout status deployment/${DEPLOYMENT}

# Verify updated image
kubectl describe deployment ${DEPLOYMENT} | grep -i image: