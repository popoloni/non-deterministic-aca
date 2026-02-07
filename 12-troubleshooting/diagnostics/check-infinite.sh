#!/bin/bash
# Diagnose why a Ralph loop never exits

echo "=== Infinite Loop Diagnostics ==="

echo ""
echo "1. Completion promise in output:"
if [[ -f progress.txt ]]; then
    PROMISE=$(grep -c "promise.*COMPLETE\|COMPLETE.*promise" progress.txt)
    echo "   Found $PROMISE completion promise(s)"
    if [[ "$PROMISE" == "0" ]]; then
        echo "   → Agent never outputs completion promise"
        echo "   Check prompt for exact format: <promise>COMPLETE</promise>"
    fi
else
    echo "   No progress.txt found"
fi

echo ""
echo "2. Plan file updates:"
if [[ -f prd.json ]]; then
    COMMITS=$(git log --oneline --follow prd.json 2>/dev/null | wc -l | tr -d ' ')
    echo "   prd.json has $COMMITS commits"
    INCOMPLETE=$(cat prd.json | jq '[.userStories[] | select(.passes == false)] | length')
    echo "   $INCOMPLETE tasks still incomplete"
fi

echo ""
echo "3. Quality check status:"
echo "   Running checks manually..."
if command -v npm &>/dev/null && [[ -f package.json ]]; then
    npm run typecheck 2>/dev/null && echo "   ✓ Typecheck" || echo "   ✗ Typecheck FAILS"
    npm run lint 2>/dev/null && echo "   ✓ Lint" || echo "   ✗ Lint FAILS"
    npm test 2>/dev/null && echo "   ✓ Tests" || echo "   ✗ Tests FAIL"
fi

echo ""
echo "4. Progress patterns (repeated errors):"
if [[ -f progress.txt ]]; then
    echo "   Most repeated lines:"
    sort progress.txt | uniq -c | sort -rn | head -5
fi

echo ""
echo "=== Diagnostics complete ==="
