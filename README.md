# Rootly Cursor Plugin

Use Rootly inside Cursor for incident response, on-call, status updates, handoffs, retrospectives, and deploy checks.

## Quick Start

1. Install **Rootly** from the Cursor marketplace, or add this repository as a plugin source.
2. Create a Rootly API token in **Rootly > Settings > API Keys**.
3. Make sure `ROOTLY_API_TOKEN` is available in the environment Cursor launches with.
4. Restart Cursor if needed.
5. Run `/rootly-setup`.

`/rootly-setup` verifies:

- `ROOTLY_API_TOKEN`
- Rootly MCP connectivity
- a lightweight tool call

## Commands

- `/rootly-setup` - validate auth and Rootly connectivity
- `/rootly-incident` - investigate an incident and produce a response brief
- `/rootly-oncall` - show current on-call, next handoff, and shift health
- `/rootly-status` - draft an internal, leadership, or customer-facing status update
- `/rootly-brief` - generate a concise stakeholder brief
- `/rootly-handoff` - prepare an incident or on-call handoff
- `/rootly-retro` - draft a markdown retrospective
- `/rootly-deploy-check` - review deploy risk using Rootly context

## Examples

- `/rootly-setup`
- `/rootly-incident 4187`
- `/rootly-status 4187`
- `/rootly-handoff`
- `/rootly-retro 4199`
- `/rootly-deploy-check`
