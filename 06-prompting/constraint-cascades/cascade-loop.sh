#!/bin/bash
# Cascade loop with phase progression

PHASE=${1:-analyze}  # Start with analysis phase

while :; do
    case $PHASE in
        analyze)
            OUTPUT=$(cat PROMPT_analyze.md | claude)
            if echo "$OUTPUT" | grep -q "<phase>ANALYSIS_COMPLETE</phase>"; then
                PHASE=plan
            fi
            ;;
        plan)
            OUTPUT=$(cat PROMPT_plan.md | claude)
            if echo "$OUTPUT" | grep -q "<phase>PLAN_COMPLETE</phase>"; then
                PHASE=implement
            fi
            ;;
        implement)
            OUTPUT=$(cat PROMPT_implement.md | claude)
            if echo "$OUTPUT" | grep -q "<promise>COMPLETE</promise>"; then
                echo "All phases complete!"
                exit 0
            fi
            ;;
    esac
    sleep 2
done
