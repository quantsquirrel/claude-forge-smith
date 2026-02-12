<!-- Parent: ../AGENTS.md -->
<!-- Generated: 2026-01-31 | Updated: 2026-01-31 -->

# smelt

## Purpose

TDD methodology guide for skill creation. Teaches RED-GREEN-REFACTOR cycle applied to documentation: write pressure scenarios (test), watch agents fail (baseline), write skill, verify compliance, close loopholes. Required background for using the forge skill.

## Key Files

| File | Description |
|------|-------------|
| `SKILL.md` | Comprehensive guide to TDD-based skill creation |
| `testing-skills-with-subagents.md` | Pressure scenario templates and testing methodology |
| `graphviz-conventions.dot` | Flowchart style rules for skill documentation |

## For AI Agents

### Working In This Directory

- This skill defines the methodology used by forge skill
- Read before attempting to create or upgrade skills
- Understand RED-GREEN-REFACTOR cycle for documentation

### TDD Mapping

| TDD Concept | Skill Creation |
|-------------|----------------|
| Test case | Pressure scenario with subagent |
| Production code | Skill document (SKILL.md) |
| Test fails (RED) | Agent violates without skill |
| Test passes (GREEN) | Agent complies with skill |
| Refactor | Close loopholes |

### Key Sections in SKILL.md

- **CSO (Claude Search Optimization)** - How to write discoverable descriptions
- **Skill Types** - Technique, Pattern, Reference
- **Bulletproofing** - Counter-rationalization techniques
- **Checklist** - Complete skill creation checklist

### Testing Requirements

- Follow RED-GREEN-REFACTOR for any skill changes
- Use pressure scenarios with 3+ combined pressures
- Document rationalizations verbatim for counter-arguments

### Common Patterns

- Description must start with "Use when..."
- Never summarize workflow in description (causes shortcuts)
- Use TodoWrite for checklist items

## Dependencies

### External

- TDD knowledge (superpowers:test-driven-development recommended)

<!-- MANUAL: -->
