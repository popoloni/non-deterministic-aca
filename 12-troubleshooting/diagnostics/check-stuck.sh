#!/bin/bash
# Diagnose agent stuck on same issue

echo "=== Stuck Agent Diagnostics ==="

echo ""
echo "1. Repeated error patterns:"
if [[ -f progress.txt ]]; then
    echo "   Top repeated errors:"
    grep -i "error\|failed\|failure" progress.txt | sort | uniq -c | sort -rn | head -5
fi

echo ""
echo "2. Stuck tasks:"
if [[ -f prd.json ]]; then
    echo "   Tasks that never complete:"
    cat prd.json | jq -r '.userStories[] | select(.passes == false) | "   - \(.id): \(.title)"'
fi

echo ""
echo "3. Recent git activity:"
COMMITS_LAST_HOUR=$(git log --oneline --since="1 hour ago" 2>/dev/null | wc -l | tr -d ' ')
echo "   Commits in last hour: $COMMITS_LAST_HOUR"
if [[ "$COMMITS_LAST_HOUR" == "0" ]]; then
    echo "   → No commits in last hour. Agent may be stuck."
fi

echo ""
echo "4. AGENTS.md context check:"
if [[ -f AGENTS.md ]]; then
    LINES=$(wc -l < AGENTS.md)
    echo "   AGENTS.md has $LINES lines"
else
    echo "   ✗ No AGENTS.md found"
    echo "   → Missing context may be causing stuck state"
fi

echo ""
echo "=== Recommendations ==="
echo "  1. Decompose large tasks into 3-5 smaller tasks"
echo "  2. Add specific guidance to AGENTS.md"
echo "  3. Rewrite acceptance criteria with explicit conditions"
echo "  4. Mark tasks requiring human help as such"
