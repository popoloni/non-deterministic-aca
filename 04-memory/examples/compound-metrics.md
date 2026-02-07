# Measuring Compound Learning

> 📖 **Book Reference:** Chapter 6 — "Measuring Compound Learning"

Without measurement, compound learning is an article of faith.
These metrics provide signal on whether your memory system is working.

## Metrics

### 1. Iteration Success Rate

Track the percentage of iterations that produce a passing result
(quality checks pass, task marked done) across sessions.

```bash
# Extract success rate from progress.txt
total=$(grep -c "^Status:" progress.txt)
success=$(grep -c "^Status: SUCCESS" progress.txt)
echo "Success rate: $((success * 100 / total))% ($success / $total)"
```

**Healthy signal:** Rising success rate across sessions.
**Warning sign:** Flat or declining — agent not benefiting from accumulated knowledge.

### 2. Retry Frequency

Count how often the loop retries a task that failed on first attempt.

```bash
# Find retried tasks in progress.txt
grep "retry\|FAIL" progress.txt | head -20
```

**Healthy signal:** Decreasing retries over time as gotchas get documented.
**Warning sign:** Constant retries — feedback loop from failures to AGENTS.md may be broken.

### 3. AGENTS.md Growth and Churn

Track entries over time. Healthy = growing then stabilizing.

```bash
# Count current entries
echo "Total entries: $(grep -c '^-' AGENTS.md)"
echo "Gotchas: $(sed -n '/## Gotchas/,/## /p' AGENTS.md | grep -c '^-')"
echo "Patterns: $(sed -n '/## Patterns/,/## /p' AGENTS.md | grep -c '^-')"
echo "Recent Learnings: $(sed -n '/## Recent/,/---/p' AGENTS.md | grep -c '^-')"

# Churn over last 10 commits
git log --oneline -10 -- AGENTS.md
```

**Healthy signal:** Initial growth, then stabilization as curation balances discovery.
**Warning sign:** Only growing, never curated — context bloat incoming.

### 4. Time to First Success

When starting a new project, measure iterations until first passing task.

**Healthy signal:** Projects inheriting cross-project memory ramp up faster.
**Warning sign:** No improvement vs. greenfield — shared knowledge not being applied.

## Dashboard Script

A quick diagnostic you can run at the start of each session:

```bash
#!/bin/bash
# compound-health.sh — Quick compound learning health check

echo "=== Compound Learning Health ==="
echo ""

# Success rate
if [ -f progress.txt ]; then
  total=$(grep -c "^Status:" progress.txt 2>/dev/null || echo 0)
  success=$(grep -c "^Status: SUCCESS" progress.txt 2>/dev/null || echo 0)
  if [ "$total" -gt 0 ]; then
    rate=$((success * 100 / total))
    echo "Iteration success rate: ${rate}% ($success / $total)"
  else
    echo "No iterations recorded yet"
  fi
  
  # Retry count
  retries=$(grep -c "retry" progress.txt 2>/dev/null || echo 0)
  echo "Retries: $retries"
  
  # Recent failures
  recent_fails=$(tail -50 progress.txt | grep -c "FAIL" 2>/dev/null || echo 0)
  echo "Recent failures (last 50 lines): $recent_fails"
else
  echo "No progress.txt found"
fi

echo ""

# AGENTS.md health
if [ -f AGENTS.md ]; then
  entries=$(grep -c '^-' AGENTS.md 2>/dev/null || echo 0)
  words=$(wc -w < AGENTS.md | tr -d ' ')
  echo "AGENTS.md: $entries entries, $words words"
  
  # Warn if too large
  if [ "$words" -gt 2000 ]; then
    echo "⚠️  AGENTS.md may need curation (>2000 words)"
  fi
  
  # Last update
  last_update=$(git log -1 --format="%ar" -- AGENTS.md 2>/dev/null)
  echo "Last updated: ${last_update:-unknown}"
else
  echo "No AGENTS.md found"
fi

echo ""
echo "=== Done ==="
```

## Interpreting Results

| Scenario | Diagnosis | Action |
|----------|-----------|--------|
| High success rate, low retries | Compound learning working well | Continue; curate AGENTS.md weekly |
| Low success rate, many retries | Agent not reading or not finding learnings | Check prompt template injects AGENTS.md; verify gotcha format |
| High success rate but AGENTS.md bloated | Knowledge captured but not curated | Archive old entries; prioritize top sections |
| Success rate declining | Possible context window overflow | Measure context utilization; trim static injection |
