<!-- Parent: ../AGENTS.md -->
<!-- Generated: 2026-01-31 | Updated: 2026-01-31 -->

# data

## Purpose

Data storage directory for skill evaluation artifacts. Contains baseline configurations, detection logs, and golden packet samples for testing.

## Subdirectories

| Directory | Purpose |
|-----------|---------|
| `baseline/` | Baseline evaluation scores for skills (see `baseline/AGENTS.md`) |
| `detections/` | Logs of skill file changes detected by lazy detection |
| `golden-packets/` | Sample test data for validation |

## For AI Agents

### Working In This Directory

- `baseline/` stores JSON files with initial skill scores
- `detections/` receives logs from `skill-detector.sh`
- `golden-packets/` holds reference data for regression tests

### Testing Requirements

- JSON files must be valid
- Detection logs use JSONL format (one JSON per line)

### Common Patterns

- Baseline files named `{skill-name}.json`
- Detection log: `detection-log.jsonl`

## Dependencies

### Internal

- `../hooks/lib/skill-detector.sh` - Writes to `detections/`
- `../hooks/lib/storage-local.sh` - Manages `baseline/` data

<!-- MANUAL: -->
