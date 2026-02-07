#!/bin/bash
# Generate comprehensive debugging report

REPORT="debug-report-$(date +%Y%m%d-%H%M%S).md"

cat > "$REPORT" << EOF
# Debug Report
Generated: $(date)

## Environment
- Working directory: $(pwd)
- Branch: $(git branch --show-current 2>/dev/null || echo "N/A")
- Node version: $(node --version 2>/dev/null || echo "N/A")

## Task Status
\`\`\`json
$(cat prd.json 2>/dev/null | jq '.userStories[] | {id, title, passes}' || echo "No prd.json found")
\`\`\`

## Recent Progress (last 50 lines)
\`\`\`
$(tail -50 progress.txt 2>/dev/null || echo "No progress.txt found")
\`\`\`

## Recent Commits
\`\`\`
$(git log --oneline -20 2>/dev/null || echo "No git history")
\`\`\`

## Error Summary
\`\`\`
$(grep -i "error\|failed" progress.txt 2>/dev/null | sort | uniq -c | sort -rn | head -10 || echo "No errors found")
\`\`\`

## File Sizes
\`\`\`
$(wc -l AGENTS.md CLAUDE.md progress.txt prd.json 2>/dev/null || echo "Context files not found")
\`\`\`
EOF

echo "Report generated: $REPORT"
