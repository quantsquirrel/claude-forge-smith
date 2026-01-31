<!-- Parent: ../AGENTS.md -->
<!-- Generated: 2026-01-31 | Updated: 2026-01-31 -->

# hooks

## Purpose

Claude Code hook scripts that integrate skill-forge into the tool lifecycle. Implements lazy detection (only scanning on Write/Edit), session management, and skill usage tracking.

## Key Files

| File | Description |
|------|-------------|
| `pre-tool.sh` | PreToolUse hook - records skill invocation start time |
| `post-tool.sh` | PostToolUse hook - records skill completion and metrics |
| `session-start.sh` | Session initialization hook |
| `session-stop.sh` | Session cleanup hook |
| `user-prompt.sh` | User prompt submission hook |

## Subdirectories

| Directory | Purpose |
|-----------|---------|
| `lib/` | Shared shell library functions (see `lib/AGENTS.md`) |

## For AI Agents

### Working In This Directory

- All hooks must output valid JSON: `{"continue": true}` or `{"continue": false}`
- Source `lib/common.sh` at the top of each hook
- Use `debug_log` for stderr logging when `SKILL_EVAL_DEBUG=true`

### Testing Requirements

- Test hooks with sample JSON input via stdin
- Verify JSON output format
- Check exit codes (0 for success)

### Common Patterns

```bash
#!/bin/bash
source "$(dirname "$0")/lib/common.sh"
INPUT=$(cat)
# ... process INPUT ...
echo '{"continue": true}'
```

## Dependencies

### Internal

- `lib/` - All shared functions
- `../config/settings.env` - Configuration values

### External

- `jq` - JSON processing (optional, fallback to grep/sed)
- `date` - Timestamp generation

<!-- MANUAL: -->
