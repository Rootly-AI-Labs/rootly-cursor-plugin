---
name: setup
description: Set up and verify the Rootly Cursor plugin. Use on first run, when MCP auth is failing, or when the user wants help connecting Rootly to Cursor.
license: Apache-2.0
metadata:
  author: Rootly AI Labs
  version: "1.0.0"
  category: onboarding
---

# Rootly Setup

Use this skill when the user needs help configuring or validating the Rootly plugin.

## Default behavior

- If the user says only "set up Rootly" or "is Rootly working?", do not ask for a more detailed prompt.
- Default to checking auth, verifying MCP connectivity, and then reporting exactly what works and what still needs fixing.
- If setup is already working, finish with a short "ready to use" summary and suggest the next command or skill.

## Goals

- confirm the Rootly MCP connection is configured correctly
- verify `ROOTLY_API_TOKEN` is available
- confirm Rootly tools are reachable
- optionally map the current repository to Rootly services

## Workflow

### 1. Check authentication setup

Confirm the user understands that this plugin expects:

- `ROOTLY_API_TOKEN` to be set in the environment Cursor uses
- the plugin MCP config to send `Authorization: Bearer ${env:ROOTLY_API_TOKEN}`

If the token is missing, explain exactly what needs to be set before continuing.

If the token appears to be present, do not stop there. Continue to an actual connectivity check.

### 2. Verify MCP connectivity

Ask the agent to try a lightweight Rootly MCP call such as:

- `get_server_version`
- `search_incidents` with a tiny result set

If the call fails:

- surface the exact error
- explain whether it looks like auth, network, or MCP configuration
- tell the user the next concrete fix step

### 3. Optional repo mapping

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

### 4. Confirm success

Finish with a short readiness summary:

```md
## Rootly Setup Complete

- Auth: [configured]
- MCP connection: [working]
- Tool call: [successful (get_server_version)]
- Repo mapping: [configured or skipped]

### Try Next
- /rootly-incident
- /rootly-oncall
- /rootly-retro
- /rootly-deploy-check
```

## Guidance

- Keep setup concise and procedural.
- Prefer validating the real connection over just describing configuration.
- If setup is partially complete, say exactly what works and what still needs attention.
- Prefer action over explanation. Validate first, then explain only what is necessary.
