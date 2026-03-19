---
name: handoff
description: Prepare an on-call or incident handoff note from Rootly context. Use when ownership is changing, a shift is ending, or another responder needs a fast operational handoff.
license: Apache-2.0
metadata:
  author: Rootly AI Labs
  version: "1.0.0"
  category: on-call
---

# Rootly Handoff

Use this skill to prepare a clean handoff for the next responder.

## Default behavior

- If the user provides only an incident ID, default to an incident-specific handoff.
- If the user says only "prepare a handoff", default to the current on-call handoff view.
- Do not ask for extra structure unless the user explicitly wants a special format.

## Workflow

### 1. Gather current context

- Pull `get_oncall_handoff_summary`.
- Pull the current incident record when the handoff is incident-specific.
- Pull active incidents or recent shift incidents when they matter.

### 2. Summarize the essentials

Capture:

- what is active right now
- what changed during the current shift
- what remains unresolved
- who owns the next action

### 3. Produce a handoff note

```md
## Handoff

- Current incident or focus: [title or none]
- Current status: [status]
- What changed this shift: [summary]
- Outstanding risks: [open issue]
- Recommended next actions:
  - [action]
- Current on-call: [name]
- Next on-call: [name and time]
```

### 4. Keep it operational

- Bias toward unresolved items and next steps.
- Do not bury the most urgent risk.
- If there is no active incident, make it a pure on-call handoff note instead.
- Prefer a handoff note the next responder can act on immediately.
