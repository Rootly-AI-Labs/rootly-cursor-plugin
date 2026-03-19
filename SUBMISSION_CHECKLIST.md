# Cursor Plugin Submission Checklist

## Before Publishing

- Confirm the plugin name in `.cursor-plugin/plugin.json` is the marketplace name you want to ship
- Confirm the description matches the marketplace listing you want users to see
- Confirm `logo.svg` is the final brand-approved icon
- Confirm `primaryColor` matches Rootly brand usage
- Confirm the hosted MCP endpoint in `mcp.json` is production-ready: `https://mcp.rootly.com/mcp`
- Confirm Rootly wants env-var auth via `ROOTLY_API_TOKEN`
- Confirm Rootly support/contact URLs in `README.md`
- Confirm the repository is public or accessible to Cursor reviewers if required

## Auth Validation

- Verify Cursor can resolve `Authorization: Bearer ${env:ROOTLY_API_TOKEN}`
- Test with a valid Rootly API token from a clean Cursor install
- Test behavior when `ROOTLY_API_TOKEN` is missing
- Test behavior when `ROOTLY_API_TOKEN` is invalid or expired

## Marketplace Readiness

- Add the final GitHub repository description and topics
- Add a short social preview or repo banner if desired
- Verify the README renders cleanly on GitHub
- Make sure the LICENSE is final for open-source publication

## Product Validation

- Install the plugin from source in Cursor
- Confirm the Rootly MCP server connects successfully
- Confirm core tools appear in Cursor after install
- Verify at least one incident lookup flow works end to end
- Verify at least one on-call query works end to end

## Nice-To-Haves

- Add screenshots or a short demo GIF to the README
- Add a release tag after the first publish
- Expand the plugin later with skills, subagents, or hooks once the MCP-only version is live
