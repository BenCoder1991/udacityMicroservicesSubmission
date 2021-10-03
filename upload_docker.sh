#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub
## Reference: https://www.docker.com/sites/default/files/d8/2019-09/docker-cheat-sheet.pdf

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
dockerpath="bencdr0/mlapponline"

# Step 2:  
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"
docker login 
docker tag mlapp:latest $dockerpath:latest # according to docker standard documentation
docker image ls

# Step 3:
# Push image to a docker repository
# according to cheat-sheet and standard documentation
docker push $dockerpath:latest
docker logout


