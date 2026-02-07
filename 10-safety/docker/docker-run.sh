#!/bin/bash
# Run autonomous agent in sandboxed Docker container
# with security constraints

docker run --rm \
  --memory=4g \
  --cpus=2 \
  --storage-opt size=10G \
  -v "$(pwd)":/workspace \
  -e ANTHROPIC_API_KEY \
  --network=none \
  ralph-sandbox \
  bash -c "./scripts/ralph/ralph.sh 25"
