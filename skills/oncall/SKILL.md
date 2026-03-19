---
name: oncall
description: Show current on-call status, handoffs, shift metrics, and workload context. Use when the user asks who is on call, wants handoff context, or needs quick staffing visibility during an incident.
license: Apache-2.0
metadata:
  author: Rootly AI Labs
  version: "1.0.0"
  category: on-call
---

# Rootly On-Call

Use this skill when the user needs a compact on-call view.

## Default behavior

- If the user says only "who's on call?" or "show on-call", do not ask for more detail.
- Default to the current on-call and next handoff view.
- If the user names a team, service, or region, scope the output; otherwise provide the broadest useful default.

## Workflow

### 1. Gather data

Use Rootly tools to gather:

- `get_oncall_handoff_summary`
- `get_oncall_shift_metrics`
- `check_oncall_health_risk` when available

If the user names a team, service, or region, scope the queries accordingly.

### 2. Present a compact dashboard

```md
## On-Call Dashboard

### Current On-Call
- Who: [name]
- Since: [time]
- Incidents this shift: [count]

### Next On-Call
- Who: [name]
- Handoff: [time]

### Shift Health
- Hours on call: [hours]
- Fatigue risk: [level]
- Workload: [summary]
```

### 3. Focus on actionability

- Highlight gaps, imminent handoffs, and fatigue risk.
- If data is missing, omit empty sections instead of showing placeholders.
- During active incidents, prioritize current and next on-call plus any workload warning signs.
- Prefer a concise dashboard over a conversational explanation of the data.
