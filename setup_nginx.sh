#!/bin/bash

# Checking if Docker installed
if ! command -v docker &> /dev/null; then
    echo "Docker is not installed. Installing..."
    sudo apt update && sudo apt install -y docker.io
fi

# Runnning NGINX
echo "Starting NGINX..."
docker run -d --name nginx-server -p 80:80 nginx

