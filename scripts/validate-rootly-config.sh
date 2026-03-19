#!/bin/sh

set -eu

CONFIG_PATH=".cursor/rootly-config.json"

if [ ! -f "$CONFIG_PATH" ]; then
  exit 0
fi

if command -v python3 >/dev/null 2>&1; then
  python3 -m json.tool "$CONFIG_PATH" >/dev/null
else
  exit 0
fi

python3 - "$CONFIG_PATH" <<'PY'
import json
import sys

path = sys.argv[1]
with open(path, encoding="utf-8") as f:
    data = json.load(f)

if not isinstance(data, dict):
    raise SystemExit("rootly-config.json must contain a JSON object")

services = data.get("services")
team = data.get("team")

if services is not None and not isinstance(services, list):
    raise SystemExit("'services' must be an array when provided")

if isinstance(services, list) and any(not isinstance(item, str) or not item.strip() for item in services):
    raise SystemExit("'services' entries must be non-empty strings")

if team is not None and (not isinstance(team, str) or not team.strip()):
    raise SystemExit("'team' must be a non-empty string when provided")
PY
