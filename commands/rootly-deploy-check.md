---
name: rootly-deploy-check
description: Evaluate deployment risk using Rootly incident history and on-call context.
---

Evaluate deployment risk now using Rootly context.

- If I provide no extra text, use the current branch, recent commits, and current diff as the deployment context.
- Check active incidents, recent related incidents, and on-call readiness.
- Produce a deployment safety brief.

Expected output should include:

- risk level
- active incidents
- on-call status
- similar past incidents
- recommendation: GO, CAUTION, or NO-GO

Do not ask me for more prompt text before starting unless the deployment target cannot be inferred at all.
