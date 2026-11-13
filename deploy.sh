#!/usr/bin/env bash
set -euo pipefail

echo "Deploying Online Shop application..."

docker compose up -d --build

echo "Checking application container..."
docker compose ps

echo "Deployment completed successfully!"