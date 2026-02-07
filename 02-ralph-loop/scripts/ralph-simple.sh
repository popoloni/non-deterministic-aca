#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
MAX_ITERATIONS=${1:-25}

cd "$PROJECT_ROOT"

echo "Starting Ralph Loop (max: $MAX_ITERATIONS iterations)"

for ((i=1; i<=MAX_ITERATIONS; i++)); do
    echo "========================================"
    echo "Iteration $i of $MAX_ITERATIONS - $(date)"
    echo "========================================"
    
    OUTPUT=$(claude --dangerously-skip-permissions \
        --print < "$SCRIPT_DIR/CLAUDE.md" 2>&1 | tee /dev/stderr) || true
    
    if echo "$OUTPUT" | grep -q "<promise>COMPLETE</promise>"; then
        echo "SUCCESS! Ralph completed at iteration $i"
        exit 0
    fi
    
    echo "Iteration complete. Continuing..."
    sleep 2
done

echo "WARNING: Reached max iterations ($MAX_ITERATIONS)"
exit 1
