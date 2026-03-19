---
name: deploy-check
description: Evaluate deployment risk against Rootly incident history, active incidents, and on-call readiness. Use before deploys, merges, pushes, or risky production changes.
license: Apache-2.0
metadata:
  author: Rootly AI Labs
  version: "1.0.0"
  category: deploy-safety
---

# Rootly Deploy Check

Use this skill when the user wants a deployment safety brief.

## Default behavior

- If the user says only "is it safe to deploy?" or "check this deploy", do not ask for more detail first.
- Default to using the current branch, recent commits, and current diff as the deployment context.
- If the affected service is ambiguous, make a reasonable best-effort mapping and clearly label any uncertainty.

## Workflow

### 1. Inspect current changes

Check the current branch, recent commits, and current diff to understand what changed.

### 2. Resolve affected services

Map the change to likely Rootly services using:

- explicit repo or config mapping if available
- repository naming
- service names mentioned in the diff or user prompt

### 3. Check Rootly context

For the affected services:

- search recent incidents
- find related incidents based on the change summary
- search for active incidents
- inspect on-call readiness with `get_oncall_handoff_summary`

### 4. Produce a safety brief

```md
## Deployment Safety Brief

- Risk level: [LOW / MEDIUM / HIGH / CRITICAL]
- Branch: [name]
- Changed files: [count]

### Active Incidents
- [incident or none]

### On-Call Status
- Current: [name]
- Next handoff: [time]
- Status: [healthy / caution / gap]

### Similar Past Incidents
- [incident] - [summary]

### Recommendation
- [GO / CAUTION / NO-GO] with concise reasoning
```

### 5. Be conservative

- Treat active high-severity incidents and weak on-call coverage as major risk multipliers.
- If confidence is low, say so and recommend manual review.
- Prefer producing a risk brief with explicit uncertainty over stopping to ask for more context.
