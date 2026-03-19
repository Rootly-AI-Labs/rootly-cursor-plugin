# Rootly Cursor Plugin

A Cursor plugin for Rootly incident response. It connects Cursor to Rootly's hosted MCP server and layers on Cursor-native skills, agents, commands, and rules for production response workflows.

## Overview

This repository started from the same lightweight MCP plugin pattern as the PagerDuty Cursor plugin, then expands it into a fuller Rootly workflow plugin:

- `.cursor-plugin/plugin.json` contains the marketplace metadata
- `mcp.json` registers Rootly's hosted MCP server
- `logo.svg` provides the marketplace icon
- `skills/` contains repeatable Rootly workflows
- `agents/` contains deeper investigation specialists
- `commands/` provides shortcut entry points into common workflows
- `rules/` adds operational guardrails
- `hooks/` validates optional Rootly repo mapping config after edits

The plugin targets Rootly's hosted MCP endpoint at `https://mcp.rootly.com/mcp`.

## What This Plugin Includes

### Skills

- `incident-response`: live incident triage and response briefs
- `oncall-dashboard`: current on-call, handoffs, and workload context
- `retrospective-writer`: markdown PIR and retrospective drafts
- `deploy-check`: pre-deploy incident and on-call risk review

### Agents

- `incident-investigator`: deeper root cause analysis
- `retro-analyst`: recurring-incident and reliability trend analysis
- `deploy-guardian`: blast-radius and deployment safety analysis

### Commands

- `respond-to-incident`
- `check-oncall`
- `generate-retro`
- `deploy-safety`

### Rules

- `rootly-incident-response`: always-on guardrails for evidence-based incident work and approval before writes

### Hooks

- validates `.cursor/rootly-config.json` after edits so repo-to-service mapping stays valid

## Authentication

Rootly requires an API token. Cursor's MCP docs currently recommend environment-variable based auth for custom remote servers, with config interpolation inside `headers`. This plugin now uses that pattern:

```json
{
  "rootly": {
    "type": "streamable-http",
    "url": "https://mcp.rootly.com/mcp",
    "headers": {
      "Authorization": "Bearer ${env:ROOTLY_API_TOKEN}"
    }
  }
}
```

Create a Rootly API token in **Rootly > Settings > API Keys**, then make sure `ROOTLY_API_TOKEN` is available in the environment Cursor launches with.

This is the best supported auth pattern for the plugin today:

- Rootly's hosted MCP server expects a bearer token
- Cursor supports config interpolation in `headers`
- Cursor supports OAuth for MCP servers that require it, but Rootly's current hosted setup is bearer-token based rather than OAuth-native

## Installation

### From the Cursor Marketplace

After publication, install **Rootly** from **Settings > Plugins** or by using `/add-plugin rootly`.

### From Source

If you are testing before marketplace publication:

1. Clone this repository
2. Add it as a plugin source in Cursor
3. Ensure `ROOTLY_API_TOKEN` is set in the environment Cursor uses
4. Restart Cursor if needed so the environment variable is visible to the app

## Files

- `.cursor-plugin/plugin.json`: Cursor marketplace metadata
- `mcp.json`: hosted Rootly MCP registration
- `skills/`: Rootly incident workflows
- `agents/`: deeper investigation specialists
- `commands/`: workflow shortcuts
- `rules/`: operational guardrails
- `hooks/`: config validation hook
- `scripts/`: helper scripts used by hooks
- `logo.svg`: marketplace logo asset
- `LICENSE`: Apache 2.0 license for publication and redistribution

## Optional Repo Mapping

If a repository maps cleanly to one or more Rootly services, you can keep that mapping in `.cursor/rootly-config.json`:

```json
{
  "services": ["auth-service", "auth-worker"],
  "team": "platform-team"
}
```

The included hook validates this file after edits.

## Support

- Rootly MCP Server: https://github.com/Rootly-AI-Labs/Rootly-MCP-server
- Rootly API Docs: https://docs.rootly.com/api-reference/overview
- Rootly: https://rootly.com

## Notes For Publishing

- The plugin is hosted-MCP-first, with Cursor-native workflow layers on top
- Auth is handled through `ROOTLY_API_TOKEN`, not a hardcoded token placeholder
- If Rootly later ships OAuth for the hosted MCP server, the auth story can be upgraded to match Cursor's OAuth-native flow
