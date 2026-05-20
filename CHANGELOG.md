# Changelog

## 1.1.0 (2026-05-20)

### Added

- **OAuth2 is now the primary authentication method.** Existing users using `ROOTLY_API_TOKEN` for MCP commands need to re-authenticate via OAuth2 on first use.

### Changed

- `.mcp.json`: Removed `Authorization: Bearer` header -- OAuth2 handles auth at transport level
- `skills/setup/SKILL.md`: OAuth2-first setup flow with API token as fallback
- `README.md`: Updated quick start and setup instructions for OAuth2
- `.cursor-plugin/plugin.json`: Bumped to v2.0.0

### Notes

- API token fallback is preserved for environments without browser access
- OAuth2 login is handled automatically by Cursor when connecting to the MCP server
