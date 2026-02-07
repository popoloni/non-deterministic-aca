# 10 - Safety, Security, and Risk Management

> 📖 **Book Reference:** Chapter 11

## Overview

> "It's not if it gets popped, it's when. And what is the blast radius?" — Geoffrey Huntley

This is **not optional reading**. The techniques in this book grant AI agents extraordinary power over your codebase, your credentials, and your infrastructure.

## Contents

| File | Description |
|------|-------------|
| [Dockerfile](docker/Dockerfile) | Minimal sandbox for autonomous agents |
| [docker-run.sh](docker/docker-run.sh) | Docker run with security constraints |
| [checklist.md](checklist.md) | Pre-flight safety checklist |
| [permissions.md](permissions.md) | Permission tiers reference |

## Blast Radius Zones

| Zone | Recovery | Impact |
|------|----------|--------|
| **Sandbox** | Minutes | No real data lost |
| **Dev Machine** | Hours | Credentials compromised |
| **Production** | Days/weeks | Customer data at risk |

**Goal:** Contain ALL failures in the sandbox zone.

## Quick Start

```bash
# Build sandbox image
docker build -t ralph-sandbox -f docker/Dockerfile .

# Run with security constraints
./docker/docker-run.sh
```

## Key Rules

1. **NEVER** run on main branch
2. **ALWAYS** use a sandbox
3. **ALWAYS** use feature branches
4. **ALWAYS** set iteration limits
5. **ALWAYS** use minimal credentials
