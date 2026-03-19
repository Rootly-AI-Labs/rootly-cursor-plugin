---
name: status
description: Draft a concise status update from Rootly incident context. Use during active incidents when the user needs an internal, stakeholder, or customer-facing update.
license: Apache-2.0
metadata:
  author: Rootly AI Labs
  version: "1.0.0"
  category: incident-communication
---

# Rootly Status

Use this skill to turn incident context into a clear status update.

## Default behavior

- If the user provides only an incident ID, default to an internal status update.
- If the user says "write a customer update" or "write a leadership update", adapt tone and wording to that audience.
- Do not ask the user which audience they mean unless the difference materially changes the response and the prompt gives no clue.

## Workflow

### 1. Gather the current state

- Get the incident record with `getIncident`.
- Pull alert and timeline context when useful.
- Check current on-call or responders when ownership or next steps matter.

### 2. Determine the audience

Tailor the wording to the user's intent:

- internal engineering update
- leadership or stakeholder update
- customer-facing summary

If the audience is unclear, default to an internal operational update.

### 3. Draft a concise update

Keep the output short and specific:

```md
## Status Update

- Incident: [title] ([id])
- Current status: [status]
- Impact: [what is affected]
- What we know: [short summary]
- What we are doing: [current actions]
- Next update: [time or expectation]
```

### 4. Stay disciplined

- Do not invent certainty.
- If the root cause is not confirmed, say it is still under investigation.
- Prefer plain language over operator jargon when the audience is external.
- Default to producing the update immediately, not discussing format options first.
