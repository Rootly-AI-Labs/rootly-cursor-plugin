---
name: retro
description: Generate a structured post-incident retrospective from Rootly incident data. Use after an incident is resolved or when the user wants a markdown PIR draft.
license: Apache-2.0
metadata:
  author: Rootly AI Labs
  version: "1.0.0"
  category: retrospectives
---

# Rootly Retro

Use this skill to draft a markdown retrospective from Rootly incident data.

## Workflow

### 1. Get the incident

- Use the incident ID from the user.
- Call `getIncident` for the full incident record.
- If the incident still appears active, warn the user and confirm they still want a retrospective draft.

### 2. Gather supporting context

- Pull alert and timeline context.
- Use `find_related_incidents` to identify repeat patterns.

### 3. Draft clean markdown

Use only details supported by the data.

```md
# Retrospective: [Incident Title]

**Incident ID**: [id]
**Date**: [date]
**Duration**: [duration]
**Severity**: [severity]

## Summary
[brief summary]

## Impact
- Duration: [duration]
- Affected services: [services]
- User impact: [impact]

## Timeline
| Time | Event |
|------|-------|
| ...  | ...   |

## Root Cause Analysis
[evidence-based analysis]

## Contributing Factors
- [factor]

## What Went Well
- [item]

## What Could Be Improved
- [item]

## Action Items
| Action | Owner | Priority |
|--------|-------|----------|
| ...    | ...   | ...      |
```

### 4. Avoid fabrication

- If data is unavailable, say so directly.
- Keep recommendations grounded in actual incident evidence and historical patterns.
