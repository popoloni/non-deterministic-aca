# 13 - Ralph Loops with VS Code and GitHub Copilot

> 📖 **Book Reference:** Appendix D

## Overview

Four approaches to running Ralph Loops with GitHub Copilot, each with different trade-offs.

> ⚠️ The GitHub Copilot ecosystem for autonomous loops is younger and more fragmented than the Claude Code ecosystem. These tools work as of early 2026 but may change.

## Contents

| File | Description |
|------|-------------|
| [approaches.md](approaches.md) | Detailed comparison of all 4 approaches |
| [cli/](cli/) | Copilot CLI loop scripts and configs |
| [extensions.md](extensions.md) | VS Code extension guide |
| [subagent-orchestrator.md](subagent-orchestrator.md) | Subagent orchestration in VS Code Chat |

## Copilot vs Claude Code

| Aspect | Claude Code | GitHub Copilot |
|--------|------------|----------------|
| Primary interface | Terminal CLI | VS Code + CLI |
| Permission bypass | `--dangerously-skip-permissions` | `--yolo` / `--allow-all` |
| Granular permissions | Not available | `--allow-tool` / `--deny-tool` |
| Context passing | Stdin piping | `@file` attachment syntax |
| Model selection | Claude models only | Multiple (GPT, Claude, Gemini) |
| Subagent support | Built-in | `#runSubagent` in Chat; not in CLI |
| Cost model | API usage / subscription | Copilot subscription + premium requests |

## Quick Decision Guide

| Need | Approach |
|------|----------|
| Production AFK loops | CLI (Approach 2) with soderlind/ralph |
| Cost-sensitive bulk work | Subagent orchestration (Approach 3) |
| Visual learners / teams | aymenfurter/ralph extension (Approach 1) |
| No setup needed | Manual approach (Approach 4) |
