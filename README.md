# Rootly Cursor Plugin

A Cursor plugin that connects your AI assistant to Rootly's hosted MCP server, so you can investigate incidents, check on-call coverage, inspect services, and work with Rootly data without leaving your editor.

## Overview

This repository follows the same lightweight plugin pattern as the PagerDuty Cursor plugin:

- `.cursor-plugin/plugin.json` contains the marketplace metadata
- `mcp.json` registers Rootly's hosted MCP server
- `logo.svg` provides the marketplace icon

The plugin targets Rootly's hosted MCP endpoint at `https://mcp.rootly.com/mcp`.

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
- `logo.svg`: marketplace logo asset
- `LICENSE`: Apache 2.0 license for publication and redistribution

## Support

- Rootly MCP Server: https://github.com/Rootly-AI-Labs/Rootly-MCP-server
- Rootly API Docs: https://docs.rootly.com/api-reference/overview
- Rootly: https://rootly.com

## Notes For Publishing

- The plugin is intentionally minimal and hosted-MCP-first
- Auth is handled through `ROOTLY_API_TOKEN`, not a hardcoded token placeholder
- If Rootly later ships OAuth for the hosted MCP server, the auth story can be upgraded to match Cursor's OAuth-native flow
