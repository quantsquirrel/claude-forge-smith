<!-- Parent: ../AGENTS.md -->
<!-- Generated: 2026-01-31 | Updated: 2026-01-31 -->

# visualize

## Purpose

HTML templates for skill visualization. Provides a game-like stat sheet display showing skill levels, experience points, and upgrade status.

## Key Files

| File | Description |
|------|-------------|
| `template.html` | Main HTML template for skill stat visualization |

## For AI Agents

### Working In This Directory

- Template uses placeholder variables for dynamic data injection
- Styled for terminal-friendly output or browser display
- Shows: skill names, levels, XP bars, grades (SSS/SS/S/A/B/C)

### Testing Requirements

- Validate HTML syntax
- Test with sample skill data
- Verify responsive layout

### Common Patterns

- Use CSS variables for theming
- Keep template self-contained (inline styles)
- Support both dark and light modes

## Dependencies

### Internal

- `../skills/visualize/` - Skill that invokes this template
- `../skills/visualize/reference.md` - Grade calculation formulas

<!-- MANUAL: -->
