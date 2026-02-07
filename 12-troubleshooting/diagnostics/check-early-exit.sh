#!/bin/bash
# Diagnose why a Ralph loop exits early
# Checks plan file, branch state, and prompt configuration

echo "=== Early Exit Diagnostics ==="

echo ""
echo "1. Plan file status:"
if [[ -f prd.json ]]; then
    INCOMPLETE=$(cat prd.json | jq '[.userStories[] | select(.passes == false)] | length')
    TOTAL=$(cat prd.json | jq '.userStories | length')
    echo "   prd.json: $INCOMPLETE/$TOTAL tasks incomplete"
    if [[ "$INCOMPLETE" == "0" ]]; then
        echo "   → All tasks complete. Agent correctly exited."
    fi
elif [[ -f fix_plan.md ]]; then
    INCOMPLETE=$(grep -c "\[ \]" fix_plan.md)
    TOTAL=$(grep -c "\[" fix_plan.md)
    echo "   fix_plan.md: $INCOMPLETE/$TOTAL tasks incomplete"
else
    echo "   ✗ No plan file found (prd.json or fix_plan.md)"
    echo "   → This is likely the cause. Create a plan file."
fi

echo ""
echo "2. Branch state:"
BRANCH=$(git branch --show-current 2>/dev/null)
echo "   Current branch: $BRANCH"
if [[ -f prd.json ]]; then
    PRD_BRANCH=$(cat prd.json | jq -r '.branchName // "not set"')
    echo "   PRD branch: $PRD_BRANCH"
    if [[ "$BRANCH" != "$PRD_BRANCH" && "$PRD_BRANCH" != "not set" ]]; then
        echo "   ✗ Branch mismatch! Switch to $PRD_BRANCH"
    fi
fi

echo ""
echo "3. Prompt configuration:"
for f in scripts/ralph/CLAUDE.md scripts/ralph/PROMPT.md CLAUDE.md; do
    if [[ -f "$f" ]]; then
        echo "   Found prompt: $f"
        PROMISE=$(grep -i "promise" "$f" | head -3)
        echo "   Promise instructions: $PROMISE"
        break
    fi
done

echo ""
echo "4. Recent git activity:"
echo "   Last 5 commits:"
git log --oneline -5 2>/dev/null || echo "   No git history"

echo ""
echo "=== Diagnostics complete ==="
