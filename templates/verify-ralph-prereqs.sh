#!/bin/bash
# verify-ralph-prereqs.sh - Comprehensive Ralph prerequisites check
# Run this before your first Ralph session

set -e

echo "╔════════════════════════════════════════════════════════════╗"
echo "║          Ralph Prerequisites Verification                   ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""

PASS=0
FAIL=0
WARN=0

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

pass() { echo -e "${GREEN}✓${NC} $1"; ((PASS++)); }
fail() { echo -e "${RED}✗${NC} $1"; echo "  └─ Fix: $2"; ((FAIL++)); }
warn() { echo -e "${YELLOW}⚠${NC} $1"; echo "  └─ Note: $2"; ((WARN++)); }
section() { echo ""; echo "─── $1 ───"; }

# ─── Required Tools ──────────────────────────────────────────
section "Required Tools"

if command -v claude &>/dev/null; then
    VERSION=$(claude --version 2>/dev/null | head -1)
    pass "Claude Code CLI installed ($VERSION)"
else
    fail "Claude Code CLI not found" "npm install -g @anthropic-ai/claude-code"
fi

if command -v amp &>/dev/null; then
    pass "Amp CLI installed (alternative)"
else
    warn "Amp CLI not found" "Optional: npm install -g @anthropic-ai/amp"
fi

if command -v jq &>/dev/null; then
    pass "jq installed ($(jq --version))"
else
    fail "jq not found" "brew install jq (macOS) or apt install jq (Linux)"
fi

if command -v git &>/dev/null; then
    pass "git installed ($(git --version | cut -d' ' -f3))"
else
    fail "git not found" "Install from https://git-scm.com"
fi

# ─── Git Configuration ───────────────────────────────────────
section "Git Configuration"

if git config user.name &>/dev/null; then
    pass "git user.name configured ($(git config user.name))"
else
    fail "git user.name not set" "git config --global user.name 'Your Name'"
fi

if git config user.email &>/dev/null; then
    pass "git user.email configured ($(git config user.email))"
else
    fail "git user.email not set" "git config --global user.email 'you@example.com'"
fi

# ─── Project Structure ───────────────────────────────────────
section "Project Structure"

if git rev-parse --git-dir &>/dev/null; then
    pass "Inside a git repository"
    
    if [[ -z $(git status --porcelain) ]]; then
        pass "Git working directory is clean"
    else
        warn "Uncommitted changes" "Consider committing or stashing before Ralph"
    fi
    
    BRANCH=$(git branch --show-current)
    if [[ "$BRANCH" == "main" || "$BRANCH" == "master" ]]; then
        warn "On $BRANCH branch" "Create a feature branch: git checkout -b feature/your-feature"
    else
        pass "On feature branch: $BRANCH"
    fi
else
    fail "Not inside a git repository" "Initialize with: git init"
fi

[[ -f "AGENTS.md" ]] && pass "AGENTS.md exists" || warn "AGENTS.md not found" "Create one with project patterns"
[[ -f "fix_plan.md" ]] && pass "fix_plan.md exists" || { [[ -f "prd.json" ]] && pass "prd.json exists" || warn "No plan file found" "Create fix_plan.md or prd.json"; }

# ─── Quality Gates ────────────────────────────────────────────
section "Quality Gates (Project-Specific)"

if [[ -f "package.json" ]]; then
    pass "package.json found (Node.js project)"
    jq -e '.scripts.test' package.json &>/dev/null && pass "npm test defined" || warn "No test script" "Add for backpressure"
    jq -e '.scripts.lint' package.json &>/dev/null && pass "npm run lint defined" || warn "No lint script" "Consider ESLint"
    jq -e '.scripts.typecheck' package.json &>/dev/null && pass "npm run typecheck defined" || warn "No typecheck script" "TypeScript strongly recommended"
fi

if [[ -f "pyproject.toml" || -f "setup.py" || -f "requirements.txt" ]]; then
    pass "Python project detected"
    command -v pytest &>/dev/null && pass "pytest available" || warn "pytest not found" "pip install pytest"
    (command -v mypy &>/dev/null || command -v pyright &>/dev/null) && pass "Type checker available" || warn "No type checker" "pip install mypy - CRITICAL for Ralph"
fi

[[ -f "Cargo.toml" ]] && { pass "Rust project detected"; command -v cargo &>/dev/null && pass "cargo available" || fail "cargo not found" "Install from https://rustup.rs"; }
[[ -f "go.mod" ]] && { pass "Go project detected"; command -v go &>/dev/null && pass "go available ($(go version | cut -d' ' -f3))" || fail "go not found" "Install from https://golang.org"; }

# ─── Authentication ──────────────────────────────────────────
section "Authentication"

if [[ -f "$HOME/.config/claude/credentials.json" ]] || [[ -f "$HOME/.claude/credentials.json" ]] || [[ -n "$ANTHROPIC_API_KEY" ]]; then
    pass "Claude authentication appears configured"
else
    warn "Claude authentication unknown" "Run 'claude auth login' if needed"
fi

# ─── Summary ─────────────────────────────────────────────────
section "Summary"
echo ""
echo "════════════════════════════════════════════════════════════"
echo -e "Results: ${GREEN}$PASS passed${NC}, ${RED}$FAIL failed${NC}, ${YELLOW}$WARN warnings${NC}"
echo "════════════════════════════════════════════════════════════"

if [[ $FAIL -eq 0 ]]; then
    echo -e "\n${GREEN}Ready for Ralph!${NC}\n"
    echo "Next steps:"
    echo "  1. Create/verify fix_plan.md with tasks"
    echo "  2. Create/verify AGENTS.md with project patterns"
    echo "  3. Create a feature branch"
    echo "  4. Run: ./scripts/ralph/ralph.sh"
    exit 0
else
    echo -e "\n${RED}Please fix the issues above before running Ralph.${NC}"
    exit 1
fi
