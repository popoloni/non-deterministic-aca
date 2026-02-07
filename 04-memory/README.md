# 04 - Memory and Context Engineering

> 📖 **Book Reference:** Chapter 6

## Overview

Without persistent memory, every iteration starts from scratch. This chapter teaches how to build the memory layer that enables autonomous agents to learn and improve across iterations through four complementary channels.

## The Four Channels of Memory

| Channel | File | Purpose |
|---------|------|---------|
| Git History | git log / git diff | What was done (immutable truth) |
| Progress Log | progress.txt | What happened during execution |
| Task State | prd.json / fix_plan.md | What remains to be done |
| Knowledge Base | AGENTS.md / CLAUDE.md | What was learned |

## Contents

| File | Description |
|------|-------------|
| [progress.txt](examples/progress.txt) | Example progress log entries |
| [AGENTS.md](examples/AGENTS.md) | AGENTS.md structure template |

## Key Principles

- **Git history cannot lie** — when in doubt, read actual files
- **Progress log captures reasoning**, not just changes
- **Knowledge base must be injected into prompts** to be useful
- **Keep AGENTS.md entries brief** — they consume context window tokens
- **Compound learning** — each improvement makes future improvements easier

## AGENTS.md Structure

| Section | Content |
|---------|---------|
| Project Overview | One paragraph describing purpose and architecture |
| Patterns & Conventions | Bullet points of established patterns |
| Gotchas | Known pitfalls: "When X, then Y" |
| Style Preferences | Coding style not enforced by linters |
| Commands | Common build, test, deploy commands |
| Recent Learnings | Temporary section for new discoveries |
