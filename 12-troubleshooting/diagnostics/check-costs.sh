#!/bin/bash
# Analyze cost indicators for Ralph loops

echo "=== Cost Analysis ==="

echo ""
echo "1. Context file sizes:"
echo "   (Rough: 1 token ≈ 4 characters)"
for file in AGENTS.md CLAUDE.md progress.txt prd.json; do
    if [[ -f "$file" ]]; then
        CHARS=$(wc -c < "$file")
        TOKENS=$((CHARS / 4))
        echo "   $file: ~$TOKENS tokens ($CHARS chars)"
    fi
done

echo ""
echo "2. Total estimated context:"
TOTAL_CHARS=$(wc -c AGENTS.md CLAUDE.md progress.txt prd.json 2>/dev/null | tail -1 | awk '{print $1}')
TOTAL_TOKENS=$((TOTAL_CHARS / 4))
echo "   Total: ~$TOTAL_TOKENS tokens"
if (( TOTAL_TOKENS > 50000 )); then
    echo "   ⚠ Context may be too large. Consider pruning."
elif (( TOTAL_TOKENS < 10000 )); then
    echo "   ✓ Context size is efficient."
else
    echo "   ✓ Context size is in good range."
fi

echo ""
echo "3. Iteration count estimate:"
if [[ -f progress.txt ]]; then
    ITERATIONS=$(grep -c "Iteration\|Starting\|Beginning\|===" progress.txt)
    echo "   Estimated iterations run: $ITERATIONS"
    echo "   Estimated cost range: \$$(echo "$ITERATIONS * 0.05" | bc)-\$$(echo "$ITERATIONS * 0.50" | bc)"
fi

echo ""
echo "4. Progress efficiency:"
if [[ -f prd.json && -f progress.txt ]]; then
    COMPLETED=$(cat prd.json | jq '[.userStories[] | select(.passes == true)] | length')
    TOTAL=$(cat prd.json | jq '.userStories | length')
    echo "   Tasks completed: $COMPLETED/$TOTAL"
fi

echo ""
echo "=== Cost tips ==="
echo "  - Always set --max-iterations (start with 10-15)"
echo "  - Archive old progress.txt entries (keep last 100 lines)"
echo "  - Decompose large tasks for fewer iterations each"
echo "  - Typical cost: \$0.05-\$0.50 per iteration"
