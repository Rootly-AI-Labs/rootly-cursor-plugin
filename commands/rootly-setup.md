---
name: rootly-setup
description: Configure and verify the Rootly Cursor plugin, including auth, MCP connectivity, and optional repo mapping.
---

Validate my Rootly setup end-to-end now.

- Confirm `ROOTLY_API_TOKEN` is present.
- Test Rootly MCP connectivity.
- Run one lightweight tool call: `get_server_version`.
- Run one harmless Rootly read check such as `search_incidents` with a tiny result set.
- Output exactly one final status block only.
- Use `🟢` for a passing check and `🔴` for a failing check.
- If something fails, give exact fix steps immediately below the failed line or in one short `Fix:` section.

Use these labels in the final block:

- `Token detected:`
- `MCP connection:`
- `Tool call:`
- `Rootly read access:`

If everything is working, the success block should look like:

- `🟢 Token detected: yes`
- `🟢 MCP connection: working`
- `🟢 Tool call: successful (get_server_version)`
- `🟢 Rootly read access: working`

Do not repeat the same status lines elsewhere in the response.
Do not ask me to add more prompt text before starting.
