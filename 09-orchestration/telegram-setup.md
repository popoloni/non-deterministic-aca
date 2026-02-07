# Telegram Integration for Human-in-the-Loop

## Setup

```bash
# Configure Telegram integration
ralph bot onboard --telegram  # guided setup

# Verify configuration
ralph bot status
ralph bot test  # send a test message

# Enable in ralph.yml
bot:
  enabled: true
  telegram:
    bot_token: "your-token"  # Or RALPH_TELEGRAM_BOT_TOKEN env var
```

## Commands

| Command | Description |
|---------|-------------|
| `/status` | Show current loop state and active tasks |
| `/tasks` | List pending and completed tasks |
| `/restart` | Restart current iteration with fresh context |
| `/guidance <msg>` | Send guidance to running agent |

## Blocking Pattern

When an agent needs human input:
1. Agent emits `human.interact` event
2. Telegram notification sent to your chat
3. Agent execution pauses
4. You respond in Telegram
5. Agent resumes with your answer

### Timeout Handling

```markdown
# In agent prompt
If you need human input, emit human.interact with your question.
If no response within 30 minutes, proceed with the conservative
approach and document your assumption for later review.
```

## Parallel Loop Routing

- **Reply-to routing**: Reply to a specific agent message
- **Loop ID prefix**: `@loop-id your message`
- **Default routing**: Unaddressed messages go to primary loop
