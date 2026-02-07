#!/bin/bash
# Ralph Loop using GitHub Copilot CLI
# Based on soderlind/ralph wrapper

set -e

# Configuration
MAX_ITERATIONS=${1:-10}
PROMPT_FILE="${2:-prompts/default.txt}"
PRD_FILE="${3:-plans/prd.json}"
ALLOW_PROFILE="${4:-safe}"
MODEL="${MODEL:-gpt-5.2}"

echo "=== Ralph Loop (Copilot CLI) ==="
echo "Model: $MODEL"
echo "Max iterations: $MAX_ITERATIONS"
echo "Profile: $ALLOW_PROFILE"

for ((i=1; i<=MAX_ITERATIONS; i++)); do
    echo ""
    echo "=== Iteration $i of $MAX_ITERATIONS ==="
    
    # Build context attachment
    CONTEXT=$(mktemp)
    cat "$PROMPT_FILE" > "$CONTEXT"
    echo "" >> "$CONTEXT"
    echo "## Progress" >> "$CONTEXT"
    cat progress.txt 2>/dev/null >> "$CONTEXT" || echo "No previous progress" >> "$CONTEXT"
    
    if [[ -f "$PRD_FILE" ]]; then
        echo "" >> "$CONTEXT"
        echo "## Tasks" >> "$CONTEXT"
        cat "$PRD_FILE" >> "$CONTEXT"
    fi
    
    # Run Copilot CLI
    case "$ALLOW_PROFILE" in
        locked)
            copilot -p "@$CONTEXT Follow the attached prompt." \
                --model "$MODEL" \
                --allow-tool write
            ;;
        safe)
            copilot -p "@$CONTEXT Follow the attached prompt." \
                --model "$MODEL" \
                --allow-tool write \
                --allow-tool 'shell(pnpm:*)' \
                --allow-tool 'shell(git:*)' \
                --deny-tool 'shell(rm)' \
                --deny-tool 'shell(git push)'
            ;;
        dev)
            copilot -p "@$CONTEXT Follow the attached prompt." \
                --model "$MODEL" \
                --yolo \
                --deny-tool 'shell(rm)' \
                --deny-tool 'shell(git push)'
            ;;
    esac
    
    # Cleanup
    rm -f "$CONTEXT"
    
    # Check for completion
    if [[ -f progress.txt ]] && grep -q "<promise>COMPLETE</promise>" progress.txt; then
        echo ""
        echo "Loop completed successfully in $i iterations!"
        exit 0
    fi
    
    sleep 2
done

echo ""
echo "Reached max iterations ($MAX_ITERATIONS)"
exit 1
