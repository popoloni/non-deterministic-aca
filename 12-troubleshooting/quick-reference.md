# Quick Diagnostic Command Reference

| What to Check | Command |
|--------------|---------|
| Incomplete tasks | `cat prd.json \| jq '.userStories[] \| select(.passes == false)'` |
| Recent commits | `git log --oneline -20` |
| Progress errors | `grep -i "error\|failed" progress.txt \| tail -20` |
| Current branch | `git branch --show-current` |
| Context file sizes | `wc -l AGENTS.md CLAUDE.md progress.txt prd.json` |
| Running processes | `ps aux \| grep -E "ralph\|claude"` |
| Quality checks | `npm run typecheck && npm run lint && npm test` |
| Recent file changes | `git diff --stat HEAD~5` |
| Kill loop process | `pkill -f "ralph.sh"` |
| Reset to clean state | `git checkout -- . && git clean -fd` |

## Troubleshooting Flowchart

```
Loop Problem
    ├── Exits early?
    │   └── Yes → Check plan file, verify branch
    ├── Never exits?
    │   └── Yes → Set max-iterations, fix completion promise
    ├── Checks failing?
    │   └── Yes → Run checks manually, fix environment
    ├── Agent stuck?
    │   └── Yes → Decompose task, add context
    └── Cost issue?
        └── Yes → Check costs, set limits
```
