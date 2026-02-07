#!/bin/bash
# Emergency recovery procedures

echo "=== Emergency Recovery ==="
echo ""
echo "Select recovery action:"
echo "  1) Kill all Ralph/Claude processes"
echo "  2) Discard uncommitted changes"
echo "  3) Revert to last known good state"
echo "  4) Full post-recovery check"
echo ""
read -p "Action [1-4]: " ACTION

case "$ACTION" in
    1)
        echo "Killing processes..."
        pkill -f "ralph.sh" 2>/dev/null
        pkill -f "claude.*dangerously" 2>/dev/null
        ps aux | grep -E "ralph|claude" | grep -v grep
        echo "Done."
        ;;
    2)
        echo "Discarding uncommitted changes..."
        git stash
        echo "Changes stashed. Use 'git stash pop' to recover."
        ;;
    3)
        echo "Recent commits:"
        git log --oneline -10
        echo ""
        read -p "Reset to commit (hash): " HASH
        git branch backup-before-reset
        git reset --hard "$HASH"
        echo "Reset complete. Backup branch: backup-before-reset"
        ;;
    4)
        echo "=== Post-Recovery Verification ==="
        echo ""
        echo "Git status:"
        git status
        echo ""
        echo "Branch: $(git branch --show-current)"
        echo ""
        echo "Plan status:"
        cat prd.json 2>/dev/null | jq '.userStories | length' && echo "tasks" || echo "No plan file"
        echo ""
        echo "Quality checks:"
        npm run typecheck 2>/dev/null && echo "✓ Typecheck" || echo "✗ Typecheck"
        npm run lint 2>/dev/null && echo "✓ Lint" || echo "✗ Lint"
        npm test 2>/dev/null && echo "✓ Tests" || echo "✗ Tests"
        echo ""
        echo "Secrets check:"
        grep -r "sk-\|api_key=\|SECRET=" . --include="*.ts" --include="*.js" 2>/dev/null | grep -v node_modules && echo "⚠ Possible secrets found" || echo "✓ No secrets detected"
        ;;
    *)
        echo "Invalid action"
        exit 1
        ;;
esac
