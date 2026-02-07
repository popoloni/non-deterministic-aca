# Templates - Production-Ready Scripts and Templates

> 📖 **Book Reference:** Appendix A

## Overview

Production-ready implementations for autonomous development systems. Copy these files directly into your projects—they include error handling, logging, and safety features.

## Contents

| File | Description |
|------|-------------|
| [verify-ralph-prereqs.sh](verify-ralph-prereqs.sh) | Complete environment verification script |
| [CLAUDE-typescript.md](CLAUDE-typescript.md) | Prompt template for TypeScript/JavaScript projects |
| [CLAUDE-python.md](CLAUDE-python.md) | Prompt template for Python projects |
| [CLAUDE-rust.md](CLAUDE-rust.md) | Prompt template for Rust projects |
| [CLAUDE-go.md](CLAUDE-go.md) | Prompt template for Go projects |
| [CLAUDE-csharp.md](CLAUDE-csharp.md) | Prompt template for C#/.NET projects |
| [CLAUDE-java.md](CLAUDE-java.md) | Prompt template for Java projects (Maven/Gradle) |
| [CLAUDE-swift.md](CLAUDE-swift.md) | Prompt template for Swift projects (SPM/Xcode) |
| [PLAN.md](PLAN.md) | Planning mode prompt for generating plans |
| [fix_plan.md](fix_plan.md) | Markdown plan template |
| [prd.json](prd.json) | JSON plan template |
| [AGENTS.md](AGENTS.md) | Project knowledge base template |
| [quick-start.sh](quick-start.sh) | Quick start setup commands |

## Quick Start

```bash
# 1. Copy templates to your project
cp templates/verify-ralph-prereqs.sh scripts/
cp templates/CLAUDE-typescript.md scripts/ralph/CLAUDE.md  # or python/rust/go
cp templates/AGENTS.md .

# 2. Verify prerequisites
./scripts/verify-ralph-prereqs.sh

# 3. Create your plan
cp templates/fix_plan.md .

# 4. Run Ralph
./scripts/ralph/ralph.sh
```

## Production Checklist

- [ ] Prerequisites verified (`./scripts/verify-ralph-prereqs.sh` passes)
- [ ] Quality checks working (all checks pass on current code)
- [ ] Git state clean (no uncommitted changes)
- [ ] Feature branch created (never run on main/master)
- [ ] Tasks well-defined (small, specific, verifiable)
- [ ] Acceptance criteria clear (no ambiguity)
- [ ] Iteration limit set (start with 10-15)
- [ ] Cost monitoring active
- [ ] Time allocated for review
