#!/bin/bash
# Usage: ./scripts/build-push-liquibase.sh <github-username> <github-pat>
set -euo pipefail

if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <github-username> <github-pat>"
  exit 1
fi
GHUSER="$1"
GHPAT="$2"
IMG=ghcr.io/$GHUSER/liquibase-postgres:latest

# Download JDBC driver
curl -L -o liquibase-docker/postgresql.jar https://jdbc.postgresql.org/download/postgresql-42.6.0.jar

# Build image
cd liquibase-docker

docker build -t $IMG .

# Login and push
cd ..
echo "$GHPAT" | docker login ghcr.io -u "$GHUSER" --password-stdin
docker push $IMG

# Clean up
rm liquibase-docker/postgresql.jar

echo "Custom Liquibase image pushed: $IMG"
