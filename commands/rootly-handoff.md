---
name: rootly-handoff
description: Create an incident or on-call handoff note from Rootly context.
---

Prepare a Rootly handoff now.

- If I provided an incident ID, create an incident-specific handoff.
- If I did not provide an incident ID, default to an on-call handoff.
- Keep it clean and easy to scan for a shift change note.
- Prefer bullets over tables for the default response.
- Summarize on-call coverage instead of listing the full roster.
- Mention the most important active or recently resolved incidents that affect the next responder, without turning it into a long incident list.
- Do not include Slack/Jira links, long incident lists, or provenance notes unless they materially help the handoff.

Expected output should include:

- `Current focus:`
- `What changed this shift:`
- `Unresolved risks:`
- `Next actions:`
- `Current on-call:`
- `Next on-call:`

If useful, add one final line for `Watchouts:`.

Do not ask for a preferred structure unless I explicitly request one.
