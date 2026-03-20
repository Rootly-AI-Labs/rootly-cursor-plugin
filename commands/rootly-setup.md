---
name: rootly-setup
description: Configure and verify the Rootly Cursor plugin, including auth, MCP connectivity, and optional repo mapping.
---

Validate my Rootly setup end-to-end now.

- Confirm `ROOTLY_API_TOKEN` is configured.
- Test Rootly MCP connectivity.
- Run one lightweight tool call: `get_server_version`.
- Report pass or fail for each step.
- Use `🟢` for a passing check and `🔴` for a failing check.
- For anything failing, give exact fix steps.

If everything is working, include this success summary:

- `🟢 Auth: configured`
- `🟢 MCP connection: working`
- `🟢 Tool call: successful (get_server_version)`

If something fails, use the same format with `🔴` and then give the exact fix steps immediately below the failed line.

Do not ask me to add more prompt text before starting.
