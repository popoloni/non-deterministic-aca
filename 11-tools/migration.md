# Migration Guide

## Anthropic Plugin → Bash Script (snarktank/ralph)

**When:** You need fresh context per iteration.

### Step 1: Install snarktank/ralph
```bash
git clone https://github.com/snarktank/ralph.git
cp ralph/ralph.sh scripts/ralph/
cp ralph/CLAUDE.md scripts/ralph/
chmod +x scripts/ralph/ralph.sh
```

### Step 2: Convert your prompt
```markdown
# Before (plugin command):
/ralph-loop "Implement login feature" --completion-promise "DONE" --max-iterations 20

# After (CLAUDE.md):
## Task
Implement login feature.

## Completion
When all acceptance criteria are met, output:
<promise>COMPLETE</promise>

## Quality Checks
- npm run typecheck
- npm run lint
- npm test
```

### Step 3: Disable plugin
```bash
/plugin uninstall ralph-wiggum
```

---

## snarktank/ralph → frankbria

**When:** You need rate limiting, circuit breakers, or CI/CD integration.

### Step 1: Install frankbria
```bash
git clone https://github.com/frankbria/ralph-claude-code.git
cd ralph-claude-code && ./install.sh
```

### Step 2: Enable in your project
```bash
cd your-project && ralph-enable
```

### Step 3: Create .ralphrc
```bash
RALPH_RATE_LIMIT=100
RALPH_MAX_ITERATIONS=50
RALPH_CIRCUIT_THRESHOLD=3
RALPH_QUALITY_CHECKS="npm run typecheck && npm run lint && npm test"
```

### Step 4: Update automation scripts
```bash
# Before:  ./scripts/ralph/ralph.sh --tool claude 25
# After:   ralph --max-iterations 25
```

---

## Single-Agent → Multi-Agent (ralph-orchestrator)

**When:** You have clear use cases for agent coordination.

**Prerequisites:**
- Comfortable running 5+ single-agent loops
- Experienced failure domains and recovery
- Prepared for increased token costs

### Step 1: Install alongside existing tools
```bash
cargo install ralph-cli
```

### Step 2: Start with traditional mode
```bash
ralph init --backend claude
ralph run -p "Your existing task"
```

### Step 3: Try built-in presets
```bash
ralph init --preset tdd-red-green
ralph run
```

### Step 4: Introduce custom hats gradually
Start with 2 hats before adding more.

### Step 5: Add Telegram integration (optional)
```bash
ralph bot onboard --telegram
```

> ⚠️ Multi-agent orchestration significantly increases complexity and cost. The documentation states: "If you're not at least Stage 7, you will not be able to use advanced multi-agent systems."
