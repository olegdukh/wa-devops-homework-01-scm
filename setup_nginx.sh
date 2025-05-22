#!/bin/bash

#Set NGINX version as a variable
NGINX_VERSION="1.25.3-alpine"

# Checking if Docker installed
if ! command -v docker &> /dev/null; then
    echo "Docker is not installed. Installing..."
    sudo apt update && sudo apt install -y docker.io
fi

# Runnning NGINX
echo "We run the NGINX version $NGINX_VERSION..."
docker run -d --name nginx-server -p 80:80 nginx:$NGINX_VERSION

docker logs nginx-server > nginx.log
docker stop nginx-server && docker rm nginx-server
