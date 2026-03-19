---
name: rootly-retro
description: Draft a complete markdown retrospective from a Rootly incident ID.
---

Generate a complete markdown retrospective draft now.

- If I provided an incident ID, use it immediately.
- If I provided only the incident ID, do not ask for more prompt detail.
- Default to markdown suitable for a PIR or postmortem document.
- Prefer a clean, reusable draft over either a long narrative report or an overly compressed outline.
- Use explicit placeholders like `TBD` or `Unknown from incident data` when key facts are missing.
- Do not pad the draft with URLs, reporter metadata, or low-signal observations unless they materially help the retrospective.
- Do not include Jira links, Slack channels, owner identity, source, or Rootly record status by default.
- In the summary section, include only title, severity, status, date, and duration unless more is explicitly requested.

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

Keep the output clean and evidence-based:

- use readable sections with short paragraphs or bullets
- avoid speculative assumptions presented as facts
- if related-incident signal is weak, either omit it or compress it to one short note
- prefer `Unknown from incident data` over invented impact or root cause details
- do not infer customer impact from the title or severity alone
- if root cause is not documented, say `Root cause still under investigation`
- do not append a closing note like `Data from live Rootly read` unless I explicitly ask for provenance text
- prefer this exact customer-impact fallback when data is thin:
  - `Duration: [duration]`
  - `Affected services: Unknown from incident data`
  - `User impact: Unknown from incident data`

Do not ask me to add more prompt text before starting unless you cannot identify the incident.
