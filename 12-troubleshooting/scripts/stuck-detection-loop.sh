#!/bin/bash
# Loop with stuck detection
MAX_ITERATIONS=${1:-25}
STUCK_THRESHOLD=3
last_commit=""
stuck_count=0

for ((i=1; i<=MAX_ITERATIONS; i++)); do
    echo "=== Iteration $i of $MAX_ITERATIONS ==="
    
    # Run the agent
    claude --dangerously-skip-permissions --print < CLAUDE.md
    
    # Check for new commits
    current_commit=$(git rev-parse HEAD)
    if [[ "$current_commit" == "$last_commit" ]]; then
        ((stuck_count++))
        echo "Warning: No new commits ($stuck_count/$STUCK_THRESHOLD)"
        if ((stuck_count >= STUCK_THRESHOLD)); then
            echo "Loop appears stuck. Exiting."
            exit 1
        fi
    else
        stuck_count=0
        last_commit=$current_commit
    fi
    
    # Check for completion
    if git log -1 --pretty=%B | grep -q "<promise>COMPLETE</promise>"; then
        echo "Loop completed successfully!"
        exit 0
    fi
done

echo "Reached max iterations without completion"
exit 1
