# VS Code Manual Loop — Behavior Contracts and Fresh-Context Sessions

> 📖 **Bonus Chapter — Online Only.** *Ralph in the Editor: Behavior Contracts and the VS Code Manual Loop* is not included in the printed book. It is available exclusively as a [free PDF sample](sample-chapter5-vscode-ralph.pdf) and through the code snippets in this folder.

## Overview

The VS Code Manual Loop applies the Ralph Loop's principles inside VS Code with GitHub Copilot Agent Mode. It combines two independent solutions:

1. **Behavior Contract** — an `AGENT.md` (or `.github/copilot-instructions.md`) file that defines *how* the agent behaves
2. **Fresh-Context Loop** — a disciplined one-item-per-session workflow that prevents context degradation

Together they achieve reliability parity with the bash Ralph Loop, without requiring a CLI or any tooling beyond VS Code.

## Contents

| File | Description |
|------|-------------|
| [setup.sh](setup.sh) | One-time project scaffolding commands |
| [copilot-instructions.md](copilot-instructions.md) | Complete behavior contract for `.github/copilot-instructions.md` |
| [fix_plan.md](fix_plan.md) | Fix plan template (`tasks/fix_plan.md`) |
| [lessons.md](lessons.md) | Lessons file bootstrap (`tasks/lessons.md`) |
| [ralph_prompt.md](ralph_prompt.md) | Reusable session prompt (`tasks/ralph_prompt.md`) |
| [next_item.sh](next_item.sh) | Shell helper — reports progress, copies prompt to clipboard |
| [settings.json](settings.json) | VS Code settings for Agent Mode |
| [session-start-checklist.md](session-start-checklist.md) | Session start checklist (for any AGENT.md) |
| [lesson-format.md](lesson-format.md) | Structured lesson format template |
| [quality-gates.md](quality-gates.md) | Example quality gate specification |
| [first-session.sh](first-session.sh) | Step-by-step first session workflow |
| [sample-chapter5-vscode-ralph.pdf](sample-chapter5-vscode-ralph.pdf) | Sample chapter PDF — full worked example |

## Quick Start

```bash
# 1. Run one-time setup
bash setup.sh

# 2. Edit tasks/fix_plan.md with your actual work items

# 3. Run the session launcher
./scripts/next_item.sh

# 4. Open a new Copilot Chat in Agent Mode, paste the prompt, let it run

# 5. When done, close the chat and repeat from step 3
```

## Key Principles

- **Never reuse a chat session across work items** — quality degrades predictably with context accumulation
- **State lives in files, not chat** — task state, lessons, and plans all persist on disk
- **One item per session** — stopping and restarting is a quality mechanism, not a throughput constraint
- **Verify before done** — never mark `[x]` without running the quality gate
- **Capture lessons immediately** — corrections are written to `tasks/lessons.md` before the session ends

## The Six Behavioral Rules

1. **Plan Mode Default** — plan before coding for any 3+ step task
2. **Subagent Strategy** — use subagents for research; keep primary context lean
3. **Self-Improvement Loop** — every correction becomes a lesson in `tasks/lessons.md`
4. **Verification Before Done** — run tests and quality gates before marking complete
5. **Demand Elegance (Balanced)** — ask "is there a cleaner way?" for non-trivial changes
6. **Autonomous Bug Fixing** — fix bugs without hand-holding; consult logs and tests autonomously
