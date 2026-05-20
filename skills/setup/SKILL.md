---
name: setup
description: Set up and verify the Rootly Cursor plugin. Use on first run, when MCP auth is failing, or when the user wants help connecting Rootly to Cursor.
license: Apache-2.0
metadata:
  author: Rootly AI Labs
  version: "1.1.0"
  category: onboarding
---

# Rootly Setup

Use this skill when the user needs help configuring or validating the Rootly plugin.

## Default behavior

- If the user says only "set up Rootly" or "is Rootly working?", do not ask for a more detailed prompt.
- Default to verifying MCP connectivity via OAuth2, then validating one real Rootly read.
- Format each check with a clear status dot: `🟢` for pass, `🔴` for fail.
- Output exactly one final status block only.
- If setup is already working, finish with a short "ready to use" summary and suggest the next command or skill.

## Goals

- confirm the Rootly MCP connection is configured correctly
- confirm OAuth2 authentication works (or fallback API token)
- confirm Rootly tools are reachable
- confirm the token can perform a harmless Rootly data read
- optionally map the current repository to Rootly services

## Workflow

### 1. Verify MCP connectivity and OAuth2

Try a lightweight Rootly MCP call:

- `get_server_version`

If the call fails with 401 / OAuth prompt, Cursor should automatically start the OAuth2 flow -- a browser window will open for the user to log in to Rootly and grant access. Once authorized, retry.

If OAuth2 is not available or fails:

> **Fallback: API Token**
>
> 1. Create a Rootly API token in **Rootly > Settings > API Keys**
> 2. Set `ROOTLY_API_TOKEN` in the environment Cursor uses
> 3. Restart Cursor so it can inherit the variable
> 4. Re-run `/rootly-setup`

### 2. Verify authentication

After MCP connectivity works, call:

- `getCurrentUser`

This confirms the authenticated user and team. Report who is logged in.

If the call fails:

- surface the exact error
- explain whether it looks like auth, network, or MCP configuration
- tell the user the next concrete fix step

### 3. Verify Rootly read access

Run one harmless Rootly read such as:

- `search_incidents` with a tiny result set

This check exists to distinguish "authenticated" from "actually authorized for Rootly data access".

If the read fails:

- report the failure as `🔴 Rootly read access:`
- include the exact failure when useful, such as `401 Unauthorized`
- tell the user the next concrete fix step

### 4. Optional repo mapping

If the repository maps to one or more Rootly services, help the user create:

```json
{
  "services": ["service-name"],
  "team": "team-name"
}
```

at `.cursor/rootly-config.json`.

Use service names only when the user confirms them or when Rootly data clearly identifies the mapping.

If the user does not care about repo mapping yet, skip it and keep setup moving.

### 5. Confirm result

Finish with one final status block only:

```md
## Rootly Setup Complete

- 🟢 MCP connection: working
- 🟢 Authentication: OAuth2 (logged in as {user name})
- 🟢 Tool call: successful (get_server_version)
- 🟢 Rootly read access: working
```

If a check fails, use `🔴` on that line and follow it immediately with the exact fix step or a short `Fix:` section.

### Try Next

- /rootly-incident
- /rootly-oncall
- /rootly-retro
- /rootly-deploy-check

## Guidance

- Keep setup concise and procedural.
- Prefer validating the real connection over just describing configuration.
- Do not repeat the same status lines in prose and again in a summary.
- If setup is partially complete, say exactly what works and what still needs attention.
- Prefer action over explanation. Validate first, then explain only what is necessary.
