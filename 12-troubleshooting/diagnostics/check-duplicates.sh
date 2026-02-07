#!/bin/bash
# Detect duplicate implementations

echo "=== Duplicate Detection ==="

echo ""
echo "1. Numbered file duplicates:"
NUMBERED=$(find . -regex ".*[0-9]+\.\(ts\|tsx\|js\|jsx\)" \
    -not -path "*/node_modules/*" \
    -not -path "*/.git/*" \
    -not -path "*/test*")
if [[ -n "$NUMBERED" ]]; then
    echo "   ✗ Found numbered duplicates:"
    echo "$NUMBERED" | sed 's/^/   /'
else
    echo "   ✓ No numbered duplicates"
fi

echo ""
echo "2. Files with same name in different directories:"
find . -name "*.ts" -o -name "*.tsx" -o -name "*.js" -o -name "*.jsx" \
    | grep -v node_modules \
    | xargs -I {} basename {} \
    | sort | uniq -d | while read name; do
    echo "   Duplicate: $name"
    find . -name "$name" -not -path "*/node_modules/*" | sed 's/^/     /'
done

echo ""
echo "3. Plan file task tracking:"
if [[ -f prd.json ]]; then
    echo "   Task statuses:"
    cat prd.json | jq -r '.userStories[] | "   [\(if .passes then "✓" else " " end)] \(.id): \(.title)"'
fi

echo ""
echo "=== Detection complete ==="
