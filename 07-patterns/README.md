# 07 - Agentic Patterns in Practice

> 📖 **Book Reference:** Chapter 9

## Overview

Nearly 100 battle-tested agentic patterns across 8 categories, mapped to Ralph-based autonomous development workflows.

## Pattern Categories

| Category | Patterns | Relevance |
|----------|----------|-----------|
| Orchestration & Control | ~31 | **Critical** |
| Tool Use & Environment | ~18 | **Critical** |
| Context & Memory | ~12 | **High** |
| Feedback Loops | ~10 | **High** |
| Reliability & Eval | ~9 | **High** |
| Learning & Adaptation | ~8 | Medium |
| Security & Safety | ~5 | **High** |
| UX & Collaboration | ~4 | Medium |

## Contents

| File | Description |
|------|-------------|
| [immutable-contract.json](examples/immutable-contract.json) | Feature list as immutable contract |
| [ralph-ci.yml](examples/ralph-ci.yml) | GitHub Actions workflow for Background Agent CI |
| [solo-stack.sh](examples/solo-stack.sh) | Solo Developer Stack daily workflow script |
| [tool-call-budget.md](examples/tool-call-budget.md) | Tool call budget template for CLAUDE.md |
| [pattern-selection.md](pattern-selection.md) | Guide for choosing patterns |
| [composition-stacks.md](composition-stacks.md) | Pattern composition examples |

## Key Patterns for Ralph

### Orchestration
- **Plan-Then-Execute** — separate planning from building
- **Swarm Migration** — map-reduce for large migrations
- **Background Agent CI** — async agent with CI integration
- **Immutable Contract** — locked feature list, agent can only mark complete

### Context & Memory
- **Compounding Engineering** — each feature makes the next easier
- **Context Window Anxiety Management** — target 40-60% utilization

### Feedback
- **CI-as-Backpressure** — use CI pipeline as validation
- **Inference-Healed Code Review** — AI pre-review for PRs

### Reliability
- **Deterministic Failure Harness** — deterministic evaluation of non-deterministic output
- **Regression Safety Net** — full test suite after every commit

## Resources

- [Awesome Agentic Patterns](https://github.com/nibzard/awesome-agentic-patterns)
- [agentic-patterns.com](https://agentic-patterns.com)
