---
name: retro
description: Generate a complete markdown retrospective from a Rootly incident ID. If the user provides only an incident ID, default to producing the full draft without asking for more prompt detail.
license: Apache-2.0
metadata:
  author: Rootly AI Labs
  version: "1.0.0"
  category: retrospectives
---

# Rootly Retro

Use this skill to draft a markdown retrospective from Rootly incident data.

## Default behavior

- If the user gives only an incident ID, do not ask for a more specific prompt.
- Treat a bare incident ID as a request for a complete retrospective draft.
- Default to markdown output suitable for copy-paste into a PIR or postmortem document.
- If the user asks for a postmortem, PIR, or retrospective, assume they want the full draft unless they explicitly ask for a shorter outline.

## Workflow

### 1. Get the incident

- Use the incident ID from the user.
- Call `getIncident` for the full incident record.
- If the incident still appears active, warn the user and confirm they still want a retrospective draft.

### 2. Gather supporting context

- Pull alert and timeline context.
- Use `find_related_incidents` to identify repeat patterns.
- If useful, pull on-call or handoff context to improve the response and detection analysis.

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

## Customer Impact
- Duration: [duration]
- Affected services: [services]
- User impact: [impact]

## Timeline
| UTC Time | Local Time | Event |
|----------|------------|-------|
| ...      | ...        | ...   |

## Root Cause Hypothesis
[evidence-based analysis, clearly labeled as confirmed or still under investigation]

## Contributing Factors
- [factor]

## Detection And Response Analysis
- Detection: [how the issue was discovered]
- Response: [what responders did]
- Escalation and coordination: [handoffs, responders, notable gaps]

## What Went Well
- [item]

## What Could Be Improved
- [item]

## Action Items
| Action | Owner | Due Date |
|--------|-------|----------|
| ...    | [owner] | [due date] |
```

### 4. Avoid fabrication

- If data is unavailable, say so directly.
- Keep recommendations grounded in actual incident evidence and historical patterns.
- Prefer a complete draft over a conversational explanation.
