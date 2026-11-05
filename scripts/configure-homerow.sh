#!/usr/bin/env bash
set -euo pipefail

# Homerow stores preferences in macOS defaults rather than a portable config file.
# Keep only the deliberate shortcuts here; do not export license or update state.
if [[ "$(uname -s)" != "Darwin" ]]; then
  echo "This script is intended for macOS." >&2
  exit 1
fi

bundle_id="com.superultra.Homerow"
option_space=$'\u2325Space'
control_option_space=$'\u2303\u2325Space'

defaults write "$bundle_id" non-search-shortcut -string "$option_space"
defaults write "$bundle_id" scroll-shortcut -string "$control_option_space"

echo "Homerow shortcuts configured:"
echo "  Click:  Option-Space"
echo "  Scroll: Control-Option-Space"
