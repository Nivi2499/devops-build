#!/usr/bin/env bash
set -euo pipefail

IMAGE_NAME="devops-build-app"
IMAGE_TAG="dev"

echo "Building Docker image..."
docker build -t "${IMAGE_NAME}:${IMAGE_TAG}" .

echo "Docker image built successfully: ${IMAGE_NAME}:${IMAGE_TAG}"