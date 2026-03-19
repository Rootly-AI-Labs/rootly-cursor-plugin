---
name: brief
description: Generate a concise executive or stakeholder brief from Rootly incident data. Use when leadership needs the current state, impact, risks, and next steps in a fast summary.
license: Apache-2.0
metadata:
  author: Rootly AI Labs
  version: "1.0.0"
  category: incident-communication
---

# Rootly Brief

Use this skill when the user wants a short, high-signal incident summary for decision makers.

## Workflow

### 1. Gather the essentials

- Pull the incident record with `getIncident`.
- Pull related historical incidents if recurrence matters.
- Pull on-call or ownership context if responsibility or readiness matters.

### 2. Compress to what matters

Focus on:

- what happened
- who or what is impacted
- current operational state
- main risk or uncertainty
- next step

### 3. Produce a short brief

```md
## Incident Brief

- Incident: [title] ([id])
- Severity: [severity]
- Status: [status]
- Impact: [1-2 lines]
- Current assessment: [what we know now]
- Main risk: [key uncertainty or exposure]
- Next step: [immediate plan]
```

### 4. Optimize for leadership readability

- Lead with impact and current state.
- Keep it brief enough to read in under 30 seconds.
- Distinguish confirmed facts from working hypotheses.
