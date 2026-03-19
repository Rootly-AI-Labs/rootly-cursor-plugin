---
name: rootly-retro
description: Draft a complete markdown retrospective from a Rootly incident ID.
---

Generate a complete markdown retrospective draft now.

- If I provided an incident ID, use it immediately.
- If I provided only the incident ID, do not ask for more prompt detail.
- Default to markdown suitable for a PIR or postmortem document.

Expected output should include:

- summary
- customer impact
- timeline with UTC and local time
- root cause hypothesis
- contributing factors
- detection and response analysis
- what went well
- what did not go well
- action items with owner and due date placeholders

Do not ask me to add more prompt text before starting unless you cannot identify the incident.
