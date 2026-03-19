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
Prefer a polished first draft, not an exhaustive incident export.

```md
# Retrospective: [Incident Title]

**Incident ID**: [id]
**Date**: [date]
**Duration**: [duration]
**Severity**: [severity]

## Summary
- Title: [title]
- Severity / status: [severity] / [status]
- Date: [date]
- Duration: [duration]
- Summary: [brief summary or "Unknown from incident data"]

## Customer Impact
- Duration: [duration]
- Affected services: [services or "Unknown from incident data"]
- User impact: [impact or "Unknown from incident data"]

## Timeline
| UTC Time | Local Time | Event |
|----------|------------|-------|
| ...      | ...        | ...   |

## Root Cause Hypothesis
[confirmed root cause or brief evidence-based hypothesis]
[If unknown: "Root cause still under investigation."]

## Contributing Factors
- [factor or `TBD`]

## Detection And Response Analysis
- Detection: [how the issue was discovered or `Unknown from incident data`]
- Response: [what responders did]
- Escalation and coordination: [handoffs, responders, or notable gaps]

## What Went Well
- [item]

## What Could Be Improved
- [item]

## Action Items
| Action | Owner | Due Date |
|--------|-------|----------|
| ...    | [owner] | [due date] |
```

- Keep the draft focused on sections the user can reuse directly.
- Avoid extra frontmatter-like metadata blocks unless the user asks for them.
- Skip URLs, reporter identity, Slack channel names, Jira links, and counts unless they change the retrospective conclusions.
- In the summary section, do not include links, owner names, Slack channels, Jira references, or Rootly workflow state by default.
- If important context is missing, say so briefly inside the relevant section instead of adding a separate "Gap" section everywhere.
- If you include a root cause hypothesis, label it clearly as a hypothesis unless confirmed.
- Do not infer customer impact from severity alone.
- Do not infer customer impact from the incident title alone.
- If the incident data does not document impact, write `Unknown from incident data` and leave a concrete placeholder for backfill.
- If the incident data does not document root cause, write `Root cause still under investigation` instead of guessing likely technical causes.
- Do not expand weak related-incident matches into a major theme unless the evidence is strong.
- Keep action items to the 3-5 highest-value follow-ups unless the user asks for a fuller list.
- Do not add provenance footers like `Data from live Rootly read; no writes` unless the user asks for that note.

### 4. Avoid fabrication

- If data is unavailable, say so directly.
- Keep recommendations grounded in actual incident evidence and historical patterns.
- Prefer a complete draft over a conversational explanation.
