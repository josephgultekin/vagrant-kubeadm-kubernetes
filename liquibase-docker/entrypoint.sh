#!/bin/sh
set -e

# Print debug info
echo "Running entrypoint.sh as: $(whoami)"

liquibase update
