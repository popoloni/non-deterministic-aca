# 12 - Troubleshooting and Debugging

> 📖 **Book Reference:** Appendix C

## Overview

> "Failures are data. Each failure teaches the system what to fix—and teaches you what to improve in your configuration." — Geoffrey Huntley

Systematic approaches to diagnosing and fixing common issues when autonomous loops fail or behave unexpectedly.

## Contents

| File | Description |
|------|-------------|
| [diagnostics/](diagnostics/) | Diagnostic scripts by symptom |
| [scripts/](scripts/) | Recovery and monitoring scripts |
| [quick-reference.md](quick-reference.md) | Quick diagnostic command reference |

## Troubleshooting by Symptom

| Symptom | Script | Common Cause |
|---------|--------|-------------|
| Loop exits early | [check-early-exit.sh](diagnostics/check-early-exit.sh) | Missing plan file or wrong branch |
| Loop never exits | [check-infinite.sh](diagnostics/check-infinite.sh) | Wrong completion promise format |
| Quality checks failing | [check-quality.sh](diagnostics/check-quality.sh) | Environment mismatch |
| Agent stuck on same issue | [check-stuck.sh](diagnostics/check-stuck.sh) | Task too large or missing context |
| Duplicate implementations | [check-duplicates.sh](diagnostics/check-duplicates.sh) | Not searching before implementing |
| Cost running away | [check-costs.sh](diagnostics/check-costs.sh) | No iteration limits set |
