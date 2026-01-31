<!-- Parent: ../AGENTS.md -->
<!-- Generated: 2026-01-31 | Updated: 2026-01-31 -->

# visualize

## Purpose

Renders skill inventory as a gamified RPG-style character sheet in the browser. Shows skill levels, XP bars, grades (SSS~F), job titles, and upgrade status. Reads evaluation data and installed skills to generate HTML visualization.

## Key Files

| File | Description |
|------|-------------|
| `SKILL.md` | Main skill definition with 4-step workflow |
| `reference.md` | JSON schemas, grade tables, categories, and icon keys |

## For AI Agents

### Working In This Directory

- Always generate HTML even if user asks for text-only (provide both)
- Generate placeholder data if evaluation data missing (never skip)
- Output to `/tmp/skill-up-viz.html` and open in browser

### 4-Step Workflow

1. Read eval data from `~/.claude/.skill-evaluator/skills/{YYYY-MM}.json`
2. Scan installed skills (user/project/plugin scopes)
3. Build data JSON (profile + skills array)
4. Inject into template, write HTML, open browser

### Grade System

| Grade | Threshold |
|-------|-----------|
| SSS | 100+ uses + upgraded |
| SS | 50+ uses + upgraded |
| S | 30+ uses |
| A | 20+ uses |
| B | 10+ uses |
| C | 5+ uses |
| F | < 5 uses |

### Red Flags

- "텍스트만 보여줘" → Still generate HTML + text summary
- "데이터 없음" → Generate placeholder from installed skills
- Missing data → Never give up, always visualize something

### Testing Requirements

- Test with missing data (should generate placeholder)
- Verify HTML renders correctly
- Check grade calculations match reference.md

## Dependencies

### Internal

- `../../visualize/template.html` - HTML template
- Evaluation data at `~/.claude/.skill-evaluator/skills/`

<!-- MANUAL: -->
