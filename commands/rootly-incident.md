---
name: rootly-incident
description: Triage a live production incident using Rootly context and produce a compact response brief.
---

Investigate the relevant Rootly incident now and produce a concise response brief.

- If I provided an incident ID, use it immediately.
- If I did not provide an incident ID, search active incidents.
- If one obvious active incident exists, use it without asking.
- If several plausible incidents exist, show a short list for me to choose from.
- If none exist, say so clearly.

Keep the output compact, operational, and grounded in Rootly data.

Expected output should include:

- `Incident:`
- `Status:`
- `Severity:`
- `What happened:`
- `Current responders / on-call:`
- `Suggested next actions:`

Do not ask me to add more prompt text before starting unless you truly cannot identify the incident.
