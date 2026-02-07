# 05 - Quality Gates and Backpressure

> 📖 **Book Reference:** Chapter 7

## Overview

Backpressure inverts traditional AI guidance: rather than prescribing how the agent should implement, you create gates that reject bad work. Tests, typechecks, builds, lints — anything that produces a binary pass/fail signal.

## Contents

| File | Description |
|------|-------------|
| [configs/typescript.json](configs/typescript.json) | TypeScript project quality config |
| [configs/python.json](configs/python.json) | Python project quality config |
| [configs/rust.json](configs/rust.json) | Rust project quality config |
| [configs/multi-language.json](configs/multi-language.json) | Multi-language project config |
| [scripts/stuck-detection.sh](scripts/stuck-detection.sh) | Detect stuck loops |
| [scripts/pre-commit-hook.sh](scripts/pre-commit-hook.sh) | Prevent test deletion |
| [prompts/verification-loop.md](prompts/verification-loop.md) | Self-critique prompt |
| [prompts/llm-as-judge.md](prompts/llm-as-judge.md) | LLM-as-Judge template |
| [prompts/anti-deletion.md](prompts/anti-deletion.md) | Anti-test-deletion rules |
| [prompts/stuck-handling.md](prompts/stuck-handling.md) | Stuck state handling |

## Quality Gates Stack

1. **Automated Tests** — catches functional bugs
2. **Type Checking** — catches type mismatches
3. **Linting** — catches style issues
4. **Security Scanning** — catches vulnerabilities
5. **LLM-as-Judge** — catches subjective issues
6. **Human Review** — final judgment

## Key Rules

- Run ALL checks after EVERY implementation attempt
- Treat warnings as errors
- Fix or quarantine flaky tests before autonomous operation
- No exceptions to "all checks pass before commit"
