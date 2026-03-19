---
name: rootly-incident
description: Triage a live production incident using Rootly context and produce a compact response brief.
---

Investigate the relevant Rootly incident now and produce a clean response brief.

- If I provided an incident ID, use it immediately.
- If I did not provide an incident ID, search active incidents.
- If one obvious active incident exists, use it without asking.
- If several plausible incidents exist, show a short list for me to choose from.
- If none exist, say so clearly.

Keep the output clean, operational, and grounded in Rootly data.
Prefer a short, well-structured brief over either a metadata dump or an overly compressed summary.
Lead with the current state and the next action, not background metadata.
Only include secondary details like Slack, Jira, meeting links, or event counts if they materially help response work.
Prefer bullets over tables for the default response.
Do not emit a field-by-field inventory unless I explicitly ask for full incident details.

Expected output should include:

- `Incident:`
- `Status:`
- `Severity:`
- `What happened:`
- `Current responders / on-call:`
- `Suggested next actions:`

If useful, add one final line for `Key risk:` or `Needs clarification:`.

Do not ask me to add more prompt text before starting unless you truly cannot identify the incident.
