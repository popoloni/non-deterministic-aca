#!/bin/bash
# Loop with cost and time controls
MAX_ITERATIONS=${1:-15}
MAX_DURATION_MINUTES=${2:-120}
START_TIME=$(date +%s)

for ((i=1; i<=MAX_ITERATIONS; i++)); do
    # Check time limit
    ELAPSED=$(( ($(date +%s) - START_TIME) / 60 ))
    if (( ELAPSED >= MAX_DURATION_MINUTES )); then
        echo "Time limit reached ($ELAPSED minutes). Stopping."
        exit 1
    fi
    
    echo "=== Iteration $i/$MAX_ITERATIONS (${ELAPSED}m elapsed) ==="
    
    # Run iteration with timeout
    timeout 15m claude --dangerously-skip-permissions --print < CLAUDE.md
    
    # Check completion
    if git log -1 --pretty=%B 2>/dev/null | grep -q "<promise>COMPLETE</promise>"; then
        echo "Completed in $i iterations, ${ELAPSED} minutes"
        exit 0
    fi
    
    sleep 2
done

echo "Reached iteration limit"
exit 1
