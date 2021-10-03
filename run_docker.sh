#!/usr/bin/env bash

## Complete the following steps to get Docker running locally
## Reference: https://www.docker.com/sites/default/files/d8/2019-09/docker-cheat-sheet.pdf

# Step 1:
docker build --tag=mlapp .

# Step 2: 
# List docker images
# https://docs.docker.com/engine/reference/commandline/images/
docker images --all

# Step 3: 
# Run flask app
# Container port 80, make-preduction port 8000 (which uses the running app)
docker run -p 8000:80 mlapp