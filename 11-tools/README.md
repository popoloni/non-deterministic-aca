# 11 - Tool Reference

> 📖 **Book Reference:** Appendix B

## Overview

Comprehensive comparison of Ralph implementations, installation guides, migration paths, and common configuration patterns.

## Contents

| File | Description |
|------|-------------|
| [comparison.md](comparison.md) | Feature-by-feature implementation comparison |
| [installation/](installation/) | Installation scripts for each tool |
| [configs/](configs/) | Ready-to-use configuration files |
| [migration.md](migration.md) | Step-by-step migration guides |

## Implementation Landscape

| Implementation | Language | Fresh Context | Production Ready |
|---------------|----------|---------------|-----------------|
| snarktank/ralph | Bash | Yes | Basic |
| Anthropic Plugin | JavaScript | No | Basic |
| frankbria/ralph-claude-code | Bash | Yes | Advanced |
| ralph-orchestrator | Rust | Yes | Advanced |

## Tool Selection Decision Tree

```
Learning Ralph? → Yes → snarktank/ralph
                → No → Production use? → No → Anthropic Plugin
                                        → Yes → Multi-agent? → No → frankbria
                                                              → Yes → ralph-orchestrator
```

## Selection by Developer Stage

| Stage | Tool | Rationale |
|-------|------|-----------|
| 5 | snarktank/ralph | Learn fundamentals with minimal complexity |
| 6 | snarktank/ralph or frankbria | Add production features as needed |
| 7 | frankbria | Rate limiting and circuit breaker essential |
| 8 | ralph-orchestrator | Ready to build/customize orchestration |
