#!/bin/bash
# solo-stack.sh - Solo Developer Stack daily workflow
# Patterns: Plan-Then-Execute + Immutable Contract + CI-as-Backpressure + Compounding Engineering
#
# Usage: ./solo-stack.sh [max-iterations]

set -euo pipefail

MAX_ITERATIONS=${1:-15}
TOOL=${2:-claude}

echo "=== Solo Developer Stack ==="
echo "Tool: $TOOL | Max iterations: $MAX_ITERATIONS"
echo ""

# 1. Planning phase (human reviews output)
echo "--- Phase 1: Planning ---"
$TOOL -p "Read specs/prd.json and the codebase.
  Produce fix_plan.md with atomic tasks, each with clear acceptance criteria.
  Do NOT implement anything. Planning only." \
  --dangerously-skip-permissions

echo ""
echo ">>> Review fix_plan.md now. Press Enter to lock the plan and start building, or Ctrl+C to abort."
read -r

# 2. Lock the plan as an immutable contract
git add fix_plan.md && git commit -m "plan: lock v1"
echo "Plan locked."

# 3. Building phase (Ralph loop)
echo ""
echo "--- Phase 2: Building (Ralph Loop) ---"
./scripts/ralph/ralph.sh "$MAX_ITERATIONS" "$TOOL"

# 4. Compound learning (after loop completes)
echo ""
echo "--- Phase 3: Compound Learning ---"
$TOOL -p "Review today's git log and AGENTS.md.
  Add any new patterns or conventions discovered during this session.
  Do NOT change code — only update AGENTS.md." \
  --dangerously-skip-permissions

git add AGENTS.md && git commit -m "learn: compound learnings from $(date +%Y-%m-%d)"

echo ""
echo "=== Solo Developer Stack complete ==="
