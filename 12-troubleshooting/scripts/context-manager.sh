#!/bin/bash
# Manage context size to stay in the effective range

echo "=== Context Size Analysis ==="

# Estimate token counts (rough: 1 token ≈ 4 characters)
for file in AGENTS.md CLAUDE.md progress.txt prd.json; do
    if [[ -f "$file" ]]; then
        CHARS=$(wc -c < "$file")
        TOKENS=$((CHARS / 4))
        echo "$file: ~$TOKENS tokens ($CHARS chars)"
    fi
done

# Archive old progress entries (keep last 100)
if [[ -f progress.txt ]]; then
    LINES=$(wc -l < progress.txt)
    if (( LINES > 100 )); then
        echo ""
        echo "progress.txt has $LINES lines. Archiving..."
        tail -100 progress.txt > progress.txt.tmp
        mv progress.txt.tmp progress.txt
        echo "Kept last 100 lines."
    fi
fi

# Warn about large AGENTS.md
if [[ -f AGENTS.md ]]; then
    SIZE=$(wc -c < AGENTS.md)
    if (( SIZE > 10000 )); then
        echo ""
        echo "WARNING: AGENTS.md is large ($SIZE bytes)"
        echo "Consider summarizing or archiving older entries"
    fi
fi
