#!/bin/bash
# Day 52 Task 52 – Rollback nginx-deployment to previous revision

DEPLOYMENT="nginx-deployment"

# Rollback to previous revision
kubectl rollout undo deployment/${DEPLOYMENT}

# (Optional) If multiple revisions exist and you want a specific one:
# kubectl rollout undo deployment/${DEPLOYMENT} --to-revision=1

# Check rollout status
kubectl rollout status deployment/${DEPLOYMENT}

# Verify the image after rollback
kubectl describe deployment ${DEPLOYMENT} | grep -i image:
