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
docker tag mlapp:latest bencdr0/mlapponline:latest # according to docker standard documentation
docker image ls

# Step 3:
# Push image to a docker repository
# according to cheat-sheet and standard documentation
docker push bencdr0/mlapponline:latest
docker logout


