#!/usr/bin/env bash
set -e

echo "Building Docker image..."
docker build -t gs-lambda-layer .

echo "Creating container..."
container_id=$(docker create gs-lambda-layer sleep 1)

echo "Copying built Lambda layer ZIP to host..."
docker cp "$container_id":/tmp/ghostscript.zip ./ghostscript.zip

echo "Cleaning up container..."
docker rm "$container_id"