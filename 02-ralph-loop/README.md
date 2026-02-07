# 02 - The Ralph Loop Pattern

> 📖 **Book Reference:** Chapter 4

## Overview

The Ralph Loop is the core pattern of autonomous development: a repeating cycle where an AI agent reads a plan, implements one task, validates its work, commits if successful, and loops until all tasks are complete.

## Contents

| File | Description |
|------|-------------|
| [ralph.sh](scripts/ralph.sh) | Production-ready Ralph Loop script |
| [CLAUDE.md](prompts/CLAUDE.md) | Standard prompt template for the loop |
| [fix_plan.md](examples/fix_plan.md) | Example implementation plan |
| [AGENTS.md](examples/AGENTS.md) | Example project patterns file |

## The Minimal Ralph Loop

The simplest possible Ralph Loop:

```bash
while :; do cat PROMPT.md | claude ; done
```

## The Completion Promise

The standard signal that all tasks are complete:

```xml
<promise>COMPLETE</promise>
```

## The Iteration Cycle

1. **Read State** — Load AGENTS.md, specs/*, fix_plan.md
2. **Orient and Select** — Find the highest-priority incomplete task
3. **Search Before Implementing** — Never assume code doesn't exist
4. **Implement** — Full implementation, no placeholders
5. **Validate** — Run all quality checks
6. **Commit and Update Plan** — Mark task complete, git commit, push
7. **Record Learnings** — Update AGENTS.md with discoveries

## Quick Start

```bash
# 1. Create directory structure
mkdir -p scripts/ralph specs

# 2. Copy the scripts
cp 02-ralph-loop/scripts/ralph.sh scripts/ralph/
cp 02-ralph-loop/prompts/CLAUDE.md scripts/ralph/

# 3. Create your plan
cp 02-ralph-loop/examples/fix_plan.md .

# 4. Initialize AGENTS.md
cp 02-ralph-loop/examples/AGENTS.md .

# 5. Create a feature branch and run
git checkout -b feature/ralph-demo
chmod +x scripts/ralph/ralph.sh
./scripts/ralph/ralph.sh 10
```

## Implementation Options

### Bash Script (Recommended)
The [ralph.sh](scripts/ralph.sh) script in this folder is a production-ready implementation.

### Stop Hook (Plugin)
Claude Code's official ralph-wiggum plugin uses a stop hook approach:
```bash
/ralph-loop "Implement the authentication system" \
    --completion-promise "DONE" \
    --max-iterations 20
```

See [Appendix B](../11-tools/) for full tool comparisons.

## Reviewing Results

```bash
cat fix_plan.md        # Check plan status
cat AGENTS.md          # Review learnings
git log --oneline -10  # See commits
git diff main...HEAD   # Examine changes
```
