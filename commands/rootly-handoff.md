---
name: rootly-handoff
description: Create an incident or on-call handoff note from Rootly context.
---

Prepare a Rootly handoff now.

- If I provided an incident ID, create an incident-specific handoff.
- If I did not provide an incident ID, default to an on-call handoff.

Expected output should include:

- `Current focus:`
- `What changed this shift:`
- `Unresolved risks:`
- `Next actions:`
- `Current on-call:`
- `Next on-call:`

Do not ask for a preferred structure unless I explicitly request one.
