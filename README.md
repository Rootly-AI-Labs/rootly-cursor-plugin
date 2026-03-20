# Rootly Cursor Plugin

![Rootly x Cursor banner](./rootlyaixcursor.png)

[![Rootly Integration](https://img.shields.io/badge/Rootly-Integration-0F172A?style=flat)](https://rootly.com)
[![License](https://img.shields.io/badge/License-Apache%202.0-16A34A?style=flat)](LICENSE)
[![Cursor Plugin](https://img.shields.io/badge/Cursor-Plugin-2563EB?style=flat)](https://cursor.com)

Use Rootly inside Cursor for incident response, on-call, status updates, handoffs, retrospectives, and deploy checks.

This plugin brings Rootly context directly into Cursor so you can investigate incidents, understand on-call coverage, draft communications, and prepare follow-up artifacts without constantly switching between tools. It is designed to be command-first, with clean workflows for the tasks teams repeat most during production response.

Use it when you want to:

- validate Rootly connectivity from Cursor
- investigate an incident with live Rootly context
- check current on-call ownership and upcoming handoffs
- draft status updates, briefs, handoffs, and retrospectives
- sanity-check deploy risk against active incidents and responder coverage

The main user-facing interface is the Rootly command set. Start with `/rootly-setup`, then use the other commands as focused workflows for the job at hand.

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

## How To Use It

The simplest way to use the plugin is through the `/rootly-*` commands below. In practice, most teams start with:

- `/rootly-incident <id>` during active response
- `/rootly-oncall` for ownership and handoff context
- `/rootly-status <id>` for updates
- `/rootly-retro <id>` after resolution

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
