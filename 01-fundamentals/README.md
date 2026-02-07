# 01 - Fundamentals

> 📖 **Book Reference:** Chapters 1–3

## Overview

This section covers the foundational concepts:

- **Chapter 1: The Autonomous Revolution** — The shift from AI-assisted to autonomous development
- **Chapter 2: The Philosophy of Autonomous Systems** — Backpressure, LLM-as-Judge, and system design principles
- **Chapter 3: The Evolution of Developer Roles** — The Developer Evolution Model (Stages 1–9)

## Key Concepts

### The Backpressure Model

Quality gates that provide automated feedback to the autonomous loop, preventing uncontrolled generation.

### LLM-as-Judge

Using AI to evaluate subjective quality criteria with binary PASS/FAIL verdicts:

```text
Evaluate whether the following component meets these criteria:
- Uses design system tokens for colors and spacing
- Follows accessibility guidelines (proper labels, contrast)
- Matches the visual style of existing components

Respond with exactly one word: PASS or FAIL.
If FAIL, explain the primary issue in one sentence.
```

### Developer Evolution Model

| Stage | Description | Key Capability |
|-------|-------------|----------------|
| 1–3 | Traditional development | Manual coding |
| 4–5 | AI-assisted | Copilot, chat-based help |
| 6 | Single autonomous loops | Running Ralph loops |
| 7 | Multiple parallel agents | Managing 2–3 agents |
| 8 | Orchestration systems | Gas Town, ralph-orchestrator |
| 9 | Evolutionary software | Self-healing systems (Loom) |

## Further Reading

- Chapter 1 for the paradigm shift overview
- Chapter 2 for backpressure theory
- Chapter 3 for the complete stage descriptions
