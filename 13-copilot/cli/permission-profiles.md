# Copilot CLI Permission Profiles

## Built-in Profiles (via soderlind/ralph)

| Profile | Allows | Use Case |
|---------|--------|----------|
| `locked` | `write` only | File edits, no shell |
| `safe` | `write`, `shell(pnpm:*)`, `shell(git:*)` | Normal dev workflow |
| `dev` | All tools | Broad shell access |

**Always denied** (regardless of profile): `shell(rm)`, `shell(git push)`

## Custom Permissions

```bash
# Custom WordPress workflow
./ralph.sh --prompt prompts/wp.txt \
    --allow-tools write \
    --allow-tools 'shell(composer:*)' 10

# Allow specific npm scripts
copilot -p "..." --allow-tool 'shell(npm run test:*)'

# Allow file writes and git, deny rm
copilot -p "..." --allow-tool 'write' \
    --allow-tool 'shell(git)' --deny-tool 'shell(rm)'
```

## AFK Mode (Unattended)

```bash
# Full auto-approval (use with caution!)
copilot -p "..." --yolo --model gpt-5-mini
```

> ⚠️ `--yolo` auto-approves ALL tool calls including file deletions and network access. Use sandboxed environments, feature branches, and minimal credentials.

## Model Selection

```bash
# Default (gpt-5.2)
MODEL=gpt-5.2 ./ralph.sh ...

# Claude via Copilot
MODEL=claude-opus-4.5 ./ralph.sh ...

# Cost-efficient (no premium requests)
MODEL=gpt-5-mini ./ralph.sh ...
```
