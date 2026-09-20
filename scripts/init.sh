#!/usr/bin/env bash
set -euo pipefail
exec "$(dirname "$0")/handler.sh" start "${1:-zh}" "${2:-$HOME/clawd}"
