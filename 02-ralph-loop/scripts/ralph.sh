#!/bin/bash
#═══════════════════════════════════════════════════════════════════
# ralph.sh - Production-ready autonomous AI development loop
# 
# Usage: ./ralph.sh [max_iterations] [tool]
#   max_iterations: Maximum loop iterations (default: 25)
#   tool: "claude" or "amp" (default: claude)
#
# Requirements:
#   - claude or amp CLI installed and authenticated
#   - jq for JSON parsing
#   - CLAUDE.md or prompt.md in scripts/ralph/
#   - fix_plan.md or prd.json in project root
#
# Safety features:
#   - Maximum iteration limit
#   - Graceful shutdown on Ctrl+C
#   - Iteration timing and cost estimation
#   - Detailed logging
#   - Git state verification
#═══════════════════════════════════════════════════════════════════

set -euo pipefail

# ─── Configuration ────────────────────────────────────────────────
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
MAX_ITERATIONS=${1:-25}
TOOL=${2:-claude}
LOG_FILE="$PROJECT_ROOT/ralph.log"
SLEEP_BETWEEN_ITERATIONS=2

# Cost estimation (approximate, adjust based on your usage)
ESTIMATED_COST_PER_ITERATION=0.50

# ─── Colors ───────────────────────────────────────────────────────
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'

# ─── Logging ──────────────────────────────────────────────────────
log() {
    local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    echo "[$timestamp] $1" >> "$LOG_FILE"
    echo -e "$1"
}

log_section() {
    echo "" >> "$LOG_FILE"
    log "${BLUE}════════════════════════════════════════════════════════════${NC}"
    log "${BLUE}$1${NC}"
    log "${BLUE}════════════════════════════════════════════════════════════${NC}"
}

# ─── Cleanup handler ──────────────────────────────────────────────
cleanup() {
    echo ""
    log "${YELLOW}Received interrupt signal. Cleaning up...${NC}"
    log "Ralph stopped at iteration $CURRENT_ITERATION of $MAX_ITERATIONS"
    log "Check $LOG_FILE for details"
    exit 130
}
trap cleanup SIGINT SIGTERM

# ─── Validation ───────────────────────────────────────────────────
validate_environment() {
    log_section "Validating Environment"
    
    # Check tool availability
    if [[ "$TOOL" == "claude" ]]; then
        if ! command -v claude &>/dev/null; then
            log "${RED}Error: claude CLI not found${NC}"
            log "Install with: npm install -g @anthropic-ai/claude-code"
            exit 1
        fi
        PROMPT_FILE="$SCRIPT_DIR/CLAUDE.md"
    elif [[ "$TOOL" == "amp" ]]; then
        if ! command -v amp &>/dev/null; then
            log "${RED}Error: amp CLI not found${NC}"
            exit 1
        fi
        PROMPT_FILE="$SCRIPT_DIR/prompt.md"
    else
        log "${RED}Error: Unknown tool '$TOOL'. Use 'claude' or 'amp'${NC}"
        exit 1
    fi
    
    # Check prompt file
    if [[ ! -f "$PROMPT_FILE" ]]; then
        log "${RED}Error: Prompt file not found: $PROMPT_FILE${NC}"
        exit 1
    fi
    log "${GREEN}✓${NC} Prompt file: $PROMPT_FILE"
    
    # Check jq
    if ! command -v jq &>/dev/null; then
        log "${RED}Error: jq not found${NC}"
        log "Install with: brew install jq (macOS) or apt install jq (Linux)"
        exit 1
    fi
    log "${GREEN}✓${NC} jq available"
    
    # Check git state
    cd "$PROJECT_ROOT"
    if ! git rev-parse --git-dir &>/dev/null; then
        log "${RED}Error: Not in a git repository${NC}"
        exit 1
    fi
    log "${GREEN}✓${NC} Git repository detected"
    
    # Warn if on main/master
    BRANCH=$(git branch --show-current)
    if [[ "$BRANCH" == "main" || "$BRANCH" == "master" ]]; then
        log "${YELLOW}Warning: On $BRANCH branch. Consider using a feature branch.${NC}"
        read -p "Continue anyway? (y/N) " -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            exit 1
        fi
    else
        log "${GREEN}✓${NC} On branch: $BRANCH"
    fi
    
    # Check for plan file
    if [[ -f "$PROJECT_ROOT/fix_plan.md" ]]; then
        log "${GREEN}✓${NC} Plan file: fix_plan.md"
    elif [[ -f "$PROJECT_ROOT/prd.json" ]]; then
        log "${GREEN}✓${NC} Plan file: prd.json"
    else
        log "${YELLOW}Warning: No plan file found (fix_plan.md or prd.json)${NC}"
    fi
    
    log ""
}

# ─── Main Loop ────────────────────────────────────────────────────
run_ralph() {
    log_section "Starting Ralph Loop"
    log "Tool: $TOOL"
    log "Max iterations: $MAX_ITERATIONS"
    log "Project root: $PROJECT_ROOT"
    log "Estimated max cost: \$$(echo "$MAX_ITERATIONS * $ESTIMATED_COST_PER_ITERATION" | bc)"
    log "Log file: $LOG_FILE"
    log ""
    
    cd "$PROJECT_ROOT"
    
    CURRENT_ITERATION=0
    TOTAL_TIME=0
    
    for ((i=1; i<=MAX_ITERATIONS; i++)); do
        CURRENT_ITERATION=$i
        ITERATION_START=$(date +%s)
        
        log_section "Iteration $i of $MAX_ITERATIONS"
        log "Started: $(date '+%Y-%m-%d %H:%M:%S')"
        
        # Run the AI agent
        if [[ "$TOOL" == "amp" ]]; then
            OUTPUT=$(cat "$PROMPT_FILE" | \
                amp --dangerously-allow-all 2>&1 | tee /dev/stderr) || true
        else
            OUTPUT=$(claude --dangerously-skip-permissions \
                --print < "$PROMPT_FILE" 2>&1 | tee /dev/stderr) || true
        fi
        
        ITERATION_END=$(date +%s)
        ITERATION_DURATION=$((ITERATION_END - ITERATION_START))
        TOTAL_TIME=$((TOTAL_TIME + ITERATION_DURATION))
        
        log ""
        log "${CYAN}Iteration $i completed in ${ITERATION_DURATION}s${NC}"
        
        # Check for completion promise
        if echo "$OUTPUT" | grep -q "<promise>COMPLETE</promise>"; then
            log ""
            log_section "${GREEN}SUCCESS!${NC}"
            log "${GREEN}Ralph completed all tasks!${NC}"
            log "Finished at iteration $i of $MAX_ITERATIONS"
            log "Total time: ${TOTAL_TIME}s"
            log "Estimated cost: \$$(echo "$i * $ESTIMATED_COST_PER_ITERATION" | bc)"
            exit 0
        fi
        
        # Check for explicit failure signals
        if echo "$OUTPUT" | grep -qi "BLOCKED\|STUCK\|CANNOT PROCEED"; then
            log "${YELLOW}Ralph reported being blocked. Check output above.${NC}"
        fi
        
        log "Sleeping ${SLEEP_BETWEEN_ITERATIONS}s before next iteration..."
        sleep $SLEEP_BETWEEN_ITERATIONS
    done
    
    # Reached max iterations
    log ""
    log_section "${YELLOW}WARNING: Reached Maximum Iterations${NC}"
    log "Completed $MAX_ITERATIONS iterations without completion signal"
    log "Total time: ${TOTAL_TIME}s"
    log "Estimated cost: \$$(echo "$MAX_ITERATIONS * $ESTIMATED_COST_PER_ITERATION" | bc)"
    log ""
    log "Next steps:"
    log "  1. Check fix_plan.md or prd.json for remaining tasks"
    log "  2. Review $LOG_FILE for patterns"
    log "  3. Consider running in planning mode to regenerate the plan"
    log "  4. Run again with: ./ralph.sh $((MAX_ITERATIONS + 25))"
    exit 1
}

# ─── Entry Point ──────────────────────────────────────────────────
echo "" > "$LOG_FILE"  # Clear log file
log "Ralph Loop - $(date)"
log "═══════════════════════════════════════════════════════════════"

validate_environment
run_ralph
