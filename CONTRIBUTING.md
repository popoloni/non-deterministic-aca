# Contributing to Non-Deterministic ACA Companion Repository

## Table of Contents

- [Code of Conduct](#code-of-conduct)
- [How Can I Contribute?](#how-can-i-contribute)
- [Reporting Issues](#reporting-issues)
- [Suggesting Enhancements](#suggesting-enhancements)
- [Pull Request Process](#pull-request-process)
- [Style Guidelines](#style-guidelines)

## Code of Conduct

This project follows a simple code of conduct: be respectful, constructive, and professional in all interactions.

## How Can I Contribute?

- **Report bugs** in scripts or configurations
- **Suggest improvements** to existing examples
- **Add support** for new AI tools or languages
- **Fix documentation** errors or unclear instructions
- **Share your experience** with autonomous loops

## Reporting Issues

Use the issue templates for:
- **Outdated Example**: When a script no longer works with current tool versions
- **Missing Pattern**: When you've discovered a useful pattern not covered

## Suggesting Enhancements

```markdown
**Enhancement Title**: [Brief title]
**Problem Statement**: [What problem does this solve?]
**Proposed Solution**: [Your suggested approach]
**Book Reference**: [Which chapter/section relates?]
```

## Pull Request Process

1. Fork the repository and create a branch
2. Follow the naming convention: `type/brief-description`
3. Test any scripts on your local machine
4. Update the README if you add new files
5. Submit a PR with clear description

## Style Guidelines

### Scripts
- Include shebang line (`#!/bin/bash`)
- Add header comment explaining purpose
- Use `set -euo pipefail` for bash scripts
- Include error handling

### Markdown
- Use ATX-style headers
- Include code blocks with language identifiers
- Link back to book chapters where applicable

### Templates
- Use clear placeholder syntax: `[PLACEHOLDER]`
- Include examples where appropriate
- Test all paths before submitting
