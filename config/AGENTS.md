<!-- Parent: ../AGENTS.md -->
<!-- Generated: 2026-01-31 | Updated: 2026-01-31 -->

# config

## Purpose

Environment configuration files for the Forge plugin. Controls storage mode, paths, and debug settings.

## Key Files

| File | Description |
|------|-------------|
| `settings.env` | Main configuration with storage mode, paths, and debug flags |

## For AI Agents

### Working In This Directory

- `settings.env` is sourced by shell scripts in `../hooks/`
- `STORAGE_MODE` can be `local` (default) or `otel` (future)
- `LOCAL_STORAGE_DIR` defaults to `~/.claude/.skill-evaluator`

### Testing Requirements

- Validate environment variable syntax
- Ensure paths are valid and writable

### Common Patterns

- Use shell variable expansion (e.g., `$HOME`)
- Comment each setting for clarity
- Keep defaults sensible for first-time users

## Dependencies

### Internal

- `../hooks/lib/common.sh` - Sources this config

<!-- MANUAL: -->
