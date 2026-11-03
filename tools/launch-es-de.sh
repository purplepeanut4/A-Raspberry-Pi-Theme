#!/bin/bash
# Updates the Raspberry Circuit theme, then starts ES-DE.
#   ./launch-es-de.sh /path/to/ES-DE_x64.AppImage
APP="${1:-$ES_DE_APPIMAGE}"
[ -x "$APP" ] || { echo "Usage: $0 /path/to/ES-DE.AppImage"; exit 1; }
timeout 60 "$(dirname "$(readlink -f "$0")")/update-theme-es-de.sh" || echo "(theme update skipped)"
shift
exec "$APP" "$@"
