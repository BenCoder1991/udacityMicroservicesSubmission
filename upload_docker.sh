#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
dockerpath=bencdr/path

# Step 2:  
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"
docker login 
docker tag mlapp:latest bncdr0/udacitymicroservices:latest
docker image ls

# Step 3:
# Push image to a docker repository
# according to cheat-sheet
docker push bncdr0/udacitymicroservices:latest
docker logout


