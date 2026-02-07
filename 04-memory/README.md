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
| [AGENTS.md](examples/AGENTS.md) | Complete AGENTS.md example (Next.js project after ~20 iterations) |
| [compound-metrics.md](examples/compound-metrics.md) | Metrics for measuring compound learning effectiveness |
| [dynamic-context.md](examples/dynamic-context.md) | Dynamic context discovery patterns |

## Key Principles

- **Git history cannot lie** — when in doubt, read actual files
- **Progress log captures reasoning**, not just changes
- **Knowledge base must be injected into prompts** to be useful
- **Keep AGENTS.md entries brief** — they consume context window tokens
- **Compound learning** — each improvement makes future improvements easier
- **Dynamic context discovery** — let agents pull context on demand instead of injecting everything statically

## AGENTS.md Structure

| Section | Content |
|---------|---------|
| Architecture | Project purpose, framework, directory layout |
| Commands | Common build, test, deploy commands |
| Gotchas | Known pitfalls: "When X, then Y" |
| Patterns | Established patterns with brief rationale |
| Recent Learnings | Temporary section; review weekly, promote or discard |

> **Order matters:** Put most-used sections first (Architecture, Commands). Agents may skim or truncate later content, so dangerous gotchas and critical patterns should appear early.

## Context Injection

### The Smart Zone

Aim for **40–60% context window utilization**:
- Below 40%: agent lacks sufficient project knowledge
- Above 60%: crowding out task reasoning and recent work

### Dynamic Context Discovery

Instead of injecting everything statically, let agents pull context on demand:

| Technique | Description |
|-----------|-------------|
| Files as interface | Write long outputs to files; agent reads selectively via `tail`, `grep` |
| Chat history as files | Agent recovers details lost during summarization |
| Selective tool loading | Only tool names upfront; full descriptions loaded on demand |
| Task-aware injection | Inject only sections relevant to current task |

### What to Include vs. Omit

| Always Include | Include When Relevant | May Hurt |
|---|---|---|
| Project architecture overview | Specific source files to modify | Entire AGENTS.md when one section suffices |
| Current task + acceptance criteria | Examples of similar completed work | Progress log from unrelated tasks |
| Relevant AGENTS.md gotchas | Test files defining expected behavior | Verbose concept explanations |
| Recent progress.txt entries | Error messages from previous attempts | Files that won't be modified |

## Cross-Project Knowledge

### Progression

1. **Shared document** — start with a wiki of organizational patterns, referenced from project AGENTS.md files
2. **Portable skills** — package reusable process knowledge (PRD creation, loop structure) as installable skills
3. **MCP-based memory** — centralized memory store that agents query, receiving only conventions relevant to the current technology stack

### Skills vs. AGENTS.md

| | AGENTS.md | Skills |
|---|---|---|
| Scope | Project-specific | Cross-project |
| Loading | Static (injected at start) | Dynamic (loaded when relevant) |
| Content | Patterns, gotchas, conventions | Workflows, scripts, domain knowledge |

## Measuring Compound Learning

| Metric | What It Shows | Warning Sign |
|--------|---------------|--------------|
| Iteration success rate | Agent benefiting from accumulated knowledge | Flat or declining over sessions |
| Retry frequency | Gotchas being documented effectively | Constant retries across sessions |
| AGENTS.md growth + churn | Knowledge capture and curation balance | Only growing, never curated |
| Time to first success | Cross-project memory working | No improvement on new projects |

See [compound-metrics.md](examples/compound-metrics.md) for implementation details.

## Quick Reference

```bash
# Check context utilization (rough estimate)
wc -c AGENTS.md progress.txt prd.json | tail -1
# Rule of thumb: total < 50KB for 200K context window

# Review AGENTS.md health
grep -c "^-" AGENTS.md          # Count entries
git log --oneline AGENTS.md     # See how often it's updated

# Check progress.txt for repeated failures
grep "FAIL" progress.txt | sort | uniq -c | sort -rn
```
