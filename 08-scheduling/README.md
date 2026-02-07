# 08 - Scheduling and Overnight Execution

> 📖 **Book Reference:** Chapter 9b

## Overview

The "ship while you sleep" promise made practical. This chapter provides the complete blueprint for overnight autonomous development with compound learning.

## Contents

| File | Description |
|------|-------------|
| [scripts/daily-compound-review.sh](scripts/daily-compound-review.sh) | Job 1: Extract learnings (10:30 PM) |
| [scripts/auto-compound.sh](scripts/auto-compound.sh) | Job 2: Implement priority item (11:00 PM) |
| [macos/compound-review.plist](macos/compound-review.plist) | macOS launchd config for Job 1 |
| [macos/auto-compound.plist](macos/auto-compound.plist) | macOS launchd config for Job 2 |
| [macos/caffeinate.plist](macos/caffeinate.plist) | Keep Mac awake during automation |
| [linux/crontab](linux/crontab) | Linux cron configuration |
| [windows/ralph.ps1](windows/ralph.ps1) | PowerShell Ralph loop wrapper |
| [windows/ralph-nightly.xml](windows/ralph-nightly.xml) | Task Scheduler XML for nightly loops |
| [windows/prevent-sleep.ps1](windows/prevent-sleep.ps1) | Prevent Windows sleep during loops |

## The Two-Job Sequence

1. **Job 1: Compound Review** (10:30 PM) — Extract learnings from the day
2. **Job 2: Auto-Compound** (11:00 PM) — Implement top priority with fresh learnings

> Order matters: review FIRST, then implement. The 30-minute gap ensures learnings are committed before implementation begins.

## Quick Setup (macOS)

```bash
# Copy plist files
cp macos/*.plist ~/Library/LaunchAgents/

# Load jobs
launchctl load ~/Library/LaunchAgents/com.yourproject.daily-compound-review.plist
launchctl load ~/Library/LaunchAgents/com.yourproject.auto-compound.plist
launchctl load ~/Library/LaunchAgents/com.yourproject.caffeinate.plist

# Verify
launchctl list | grep yourproject

# Test manually
launchctl start com.yourproject.daily-compound-review
```

## Quick Setup (Windows — Native PowerShell)

```powershell
# Import the Task Scheduler XML (edit paths in the XML first)
Register-ScheduledTask -TaskName "Ralph-Nightly" `
    -Xml (Get-Content .\windows\ralph-nightly.xml -Raw)

# Prevent sleep during overnight loops
.\windows\prevent-sleep.ps1

# Test manually
.\windows\ralph.ps1 -MaxIterations 5 -Tool claude

# Re-enable sleep after testing
.\windows\prevent-sleep.ps1 -Restore
```

## Quick Setup (Windows — WSL 2, Recommended)

```bash
# Install WSL with Ubuntu (PowerShell, run as Administrator)
wsl --install -d Ubuntu

# Inside Ubuntu: install tools and use cron as in the Linux section
sudo apt install -y nodejs git jq
npm install -g @anthropic-ai/claude-code
crontab -e
```
