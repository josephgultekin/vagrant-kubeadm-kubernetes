#!/bin/bash
# Build and push FastAPI and Spring Boot images to GitHub Container Registry (ghcr.io)
# Usage: ./scripts/build-and-push-ghcr.sh <github-username> <github-pat>

set -euo pipefail

if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <github-username> <github-pat>"
  exit 1
fi

GHUSER="$1"
GHPAT="$2"

# Login to ghcr.io
echo "$GHPAT" | docker login ghcr.io -u "$GHUSER" --password-stdin

# Build and push FastAPI image
docker build -t ghcr.io/$GHUSER/fastapi-app:latest ./app
docker push ghcr.io/$GHUSER/fastapi-app:latest

# Build and push Spring Boot image
docker build -t ghcr.io/$GHUSER/springboot-app:latest ./app-springboot
docker push ghcr.io/$GHUSER/springboot-app:latest

echo "Images pushed to ghcr.io/$GHUSER/fastapi-app:latest and springboot-app:latest"
