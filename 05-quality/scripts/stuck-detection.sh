#!/bin/bash
# Stuck detection in loop script
# Monitors for lack of progress and handles stuck states

# Track last successful commit
LAST_COMMIT=$(git rev-parse HEAD)
STUCK_COUNT=0
MAX_STUCK=5
MAX_ITERATIONS=${1:-25}

for i in $(seq 1 $MAX_ITERATIONS); do
  echo "=== Iteration $i ==="
  
  # Run iteration (replace with your actual iteration command)
  # run_iteration
  
  # Check for progress
  CURRENT_COMMIT=$(git rev-parse HEAD)
  if [ "$CURRENT_COMMIT" = "$LAST_COMMIT" ]; then
    STUCK_COUNT=$((STUCK_COUNT + 1))
    echo "No progress detected ($STUCK_COUNT/$MAX_STUCK)"
    if [ $STUCK_COUNT -ge $MAX_STUCK ]; then
      echo "Stuck detected: $MAX_STUCK iterations without commit"
      # handle_stuck_state
      break
    fi
  else
    STUCK_COUNT=0
    LAST_COMMIT=$CURRENT_COMMIT
    echo "Progress detected - commit made"
  fi
done
