---
name: respond
description: Investigate and respond to a production incident. Use when paged, when an incident ID is provided, or when the user needs a concise response brief with Rootly context.
license: Apache-2.0
metadata:
  author: Rootly AI Labs
  version: "1.0.0"
  category: incident-management
---

# Rootly Respond

Use this skill when the user needs fast incident triage with Rootly data.

## Workflow

### 1. Identify the incident

- If the user gives an incident ID, use it directly.
- If they do not, search for active incidents first.
- If multiple active incidents exist, show the highest-severity incidents first and ask the user which one to investigate.

### 2. Gather context

For the selected incident:

- Call `getIncident` for the full incident record.
- Pull alert context with `get_alert_by_short_id` or alert search tools when available.
- Call `find_related_incidents` for historical matches.
- Call `suggest_solutions` for likely remediation paths.
- Call `get_oncall_handoff_summary` for current responder and handoff context.

### 3. Present a response brief

Keep the output compact and operational:

```md
## Incident Response Brief

### Summary
- Incident: [title] ([id])
- Status: [status]
- Severity: [severity]
- Started: [time]

### Timeline
- [key event]

### Related Incidents
- [incident] - confidence [score] - [resolution summary]

### Suggested Solutions
1. [recommended action]

### Current On-Call
- Current: [name]
- Next handoff: [time]
```

### 4. Handle writes conservatively

- Do not mutate Rootly data unless the user clearly asks.
- Before any write action, explain the proposed change and wait for approval.
- Treat status updates, severity changes, responder changes, and escalations as explicit approval steps.

### 5. Stay evidence-based

- Distinguish facts from inferences.
- If historical matches are weak, say so.
- If a tool returns partial or missing data, continue with what is available instead of stopping entirely.
