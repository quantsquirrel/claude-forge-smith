---
name: skill-up:upgrade-skill
description: Upgrade a skill through TDD-based testing and improvement. Creates scenario tests, evaluates discoverability, and enhances skill quality.
argument-hint: <skill-name> [--precision=high|medium|low (default: high)] [--dry-run] - modes: TDD_FIT|HEURISTIC
allowed-tools: Read, Write, Edit, Bash, Glob, Grep, Task, Skill
user-invocable: true
---

# Upgrade Skill

Systematically improve a skill through test-driven evaluation and enhancement.

**REQUIRED BACKGROUND:** First invoke `skill-up:writing-skills` skill for TDD methodology applied to skills. See `testing-skills-with-subagents.md` in that skill's directory for pressure scenario templates.

## Quick Reference

| Step | Action |
|------|--------|
| 1 | Find and read the target skill |
| 2 | Create pressure scenario tests (RED) |
| 3 | Run baseline test without skill context |
| 4 | Evaluate discoverability (CSO check) |
| 5 | Identify gaps and improvements |
| 6 | Apply improvements (GREEN) |
| 7 | Re-test to verify (REFACTOR) |
| 8 | Update `upgraded: true` in stats |

## Workflow

### 1. Locate Skill

```
Skill locations (check in order):
~/.claude/skills/{skill-name}/SKILL.md
~/.claude/plugins/**/skills/{skill-name}/SKILL.md
.claude/skills/{skill-name}/SKILL.md
```

If skill not found, report and exit.

### 2. Create Pressure Scenario Test

Generate 2-3 realistic scenarios that would trigger this skill:

**Good scenario template:**
```markdown
SCENARIO: [Realistic situation where skill should apply]

Context:
- [Specific constraint 1]
- [Specific constraint 2]
- [Time/resource pressure]

Task: [What agent must do]

Success criteria:
- [ ] Agent recognizes skill applies
- [ ] Agent follows skill correctly
- [ ] Agent produces expected outcome
```

**Pressure types to combine (pick 3+):**
- Time pressure
- Sunk cost
- Authority override
- Exhaustion
- Pragmatic shortcuts

### 3. Run Baseline Test (RED Phase)

Spawn a subagent WITHOUT skill context:
- Give scenario only
- Document what agent does naturally
- Capture rationalizations verbatim

### 4. Evaluate Discoverability (CSO Check)

Check skill's search optimization:

| Check | Pass/Fail |
|-------|-----------|
| Description starts with "Use when..." | |
| Description has specific triggers | |
| Keywords match search terms | |
| Name is verb-first, descriptive | |
| No workflow summary in description | |

### 5. Identify Improvements

Based on test results:

**If agent didn't find skill:**
- Improve description triggers
- Add error message keywords
- Add symptom keywords

**If agent found but didn't follow:**
- Add explicit counters for rationalizations
- Create red flags section
- Add foundational principle

**If skill is unclear:**
- Simplify structure
- Add concrete examples
- Remove ambiguity

### 6. Apply Improvements (GREEN Phase)

Edit the skill with identified improvements:
- Keep changes minimal and targeted
- Address specific test failures
- Don't add hypothetical content

### 7. Re-test (REFACTOR Phase)

Run same scenarios WITH improved skill:
- Agent should now comply
- If new rationalizations appear, add counters
- Continue until bulletproof

### 8. Mark as Upgraded

Update the skill stats file to set `upgraded: true`:

```bash
MONTH=$(date +%Y-%m)
SKILL_NAME="plugin-name:skill-name"  # Replace with actual skill name
STATS_FILE="$HOME/.claude/.skill-evaluator/skills/${MONTH}.json"

python3 -c "
import json
with open('$STATS_FILE', 'r') as f:
    data = json.load(f)
if '$SKILL_NAME' in data.get('skills', {}):
    data['skills']['$SKILL_NAME']['upgraded'] = True
    with open('$STATS_FILE', 'w') as f:
        json.dump(data, f, indent=2)
    print('Marked $SKILL_NAME as upgraded')
else:
    print('Skill not found in stats')
"
```

This enables:
- "강화 완료" badge in `/visualize`
- SSS/SS grade bonuses (see `skills/visualize/reference.md`)

## Output Format

After upgrade, report:

```
## Upgrade Complete: {skill-name}

### Tests Created
- Scenario 1: [description]
- Scenario 2: [description]

### Issues Found
- [Issue 1]: [How fixed]
- [Issue 2]: [How fixed]

### CSO Improvements
- [What was improved for discoverability]

### Verification
- [x] Baseline test showed failure
- [x] Improved skill passes tests
- [x] Stats updated with upgraded: true
```

## Example

User: `/upgrade-skill superpowers:tdd`

1. Invoke `skill-up:writing-skills` to load TDD methodology
2. Read the target skill: `~/.claude/skills/superpowers/tdd/SKILL.md`
3. Create scenario: "You wrote 200 lines, forgot TDD, dinner at 6:30pm..."
4. Baseline: Agent chooses to write tests after (FAIL)
5. CSO: Description missing "Use when..." (FAIL)
6. Fix: Add explicit "Delete code, start over" section
7. Re-test: Agent now deletes code (PASS)
8. Update stats: `upgraded: true`

## Common Issues

| Issue | Solution |
|-------|----------|
| Skill not found | Check all locations, suggest creation |
| No clear test scenario | Use skill's "When to Use" section |
| Agent always passes | Add more pressure (3+ combined) |
| Improvements don't help | Meta-test: ask agent what would make it clearer |
