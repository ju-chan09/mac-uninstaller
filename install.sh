#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET="/usr/local/bin/uninstall"

echo "Installing uninstall → $TARGET"
cp "$SCRIPT_DIR/uninstall" "$TARGET"
chmod +x "$TARGET"
echo "Done. Run: uninstall <AppName>"
