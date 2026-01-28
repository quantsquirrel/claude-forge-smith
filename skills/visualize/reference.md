# Visualize Reference

## Data Source

Path: `~/.claude/.skill-evaluator/skills/{YYYY-MM}.json`

```json
{
  "month": "2026-01",
  "skills": {
    "plugin-name:skill-name": {
      "usageCount": 15,
      "totalTokens": 45000,
      "hasTestCode": true,
      "upgraded": false
    }
  }
}
```

## Output JSON Schema

Replace `__SKILL_UP_DATA__` in template.html with this structure:

```json
{
  "profile": {
    "username": "<user's name>",
    "level": "<1-100>",
    "jobName": "<emoji + creative Korean title>"
  },
  "categories": ["개발", "마케팅", "디자인", "인프라", "분석", "공통"],
  "skills": [
    {
      "name": "<display name>",
      "iconKey": "<from ICON_PIXELS map>",
      "category": "<category>",
      "grade": "<SSS|SS|S|A|B|C|D|F>",
      "trigger": "<activation condition>",
      "description": "<game-style NPC quote>",
      "upgraded": "<boolean>",
      "hasTestCode": "<boolean>",
      "monthlyUsage": "<usageCount>",
      "tokenCost": "<totalTokens>",
      "scopes": { "user": "<bool>", "project": "<bool>", "plugin": "<bool>" }
    }
  ]
}
```

## Grade Calculation

| Grade | Condition |
|-------|-----------|
| SSS | usageCount 100+ AND upgraded AND high tokens |
| SS | usageCount 70+ AND upgraded |
| S | usageCount 50+ |
| A | usageCount 30+ |
| B | usageCount 15+ |
| C | usageCount 5+ |
| D | usageCount 1+ |
| F | never used |

Grade scores: SSS=10, SS=8, S=7, A=6, B=4, C=3, D=1, F=0

Level: `Math.min(100, Math.floor(skills.length * 3 + avgGradeScore * 10))`

## Category Mapping

| Category | Keywords |
|----------|----------|
| 개발 | code-review, debugging, refactoring, testing, git, api, architecture |
| 마케팅 | seo, copywriting, social-media |
| 디자인 | design, accessibility, ui, ux |
| 인프라 | devops, security, database, deployment, ci/cd |
| 분석 | data-analysis, research, monitoring |
| 공통 | documentation, automation, problem-solving, learning, communication |

## Icon Keys

code-review, debugging, refactoring, testing, git-workflow, api-design, documentation, architecture, performance, data-analysis, writing, presentation, research, project-mgmt, communication, automation, design, problem-solving, learning, security, seo, copywriting, social-media, mobile, database, accessibility, devops, eye-shield

## Job Title Examples

Based on top category + highest graded skills:
- "🎯 코드 리뷰 스나이퍼" / "🧙 Github의 마술사" / "🐛 디버깅 장인"
- "📋 철저한 계획 닌자" / "💬 커뮤니케이션 마스터" / "🤖 자동화 헌터"
- "🛡️ 보안 파수꾼" / "⚡ 퍼포먼스 닌자"

## Skill Scan Locations

| Scope | Path |
|-------|------|
| user | `~/.claude/skills/`, `~/.claude/settings.json` |
| project | `.claude/skills/` in current project |
| plugin | plugin directories with SKILL.md files |
