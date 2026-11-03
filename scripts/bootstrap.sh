#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

if [[ "$(uname -s)" != "Darwin" ]]; then
  echo "This bootstrap is intended for macOS." >&2
  exit 1
fi

if ! command -v brew >/dev/null 2>&1; then
  echo "Homebrew is missing. Review the official installer at https://brew.sh before continuing." >&2
  read -r -p "Download and run the Homebrew installer? [y/N] " answer
  [[ "$answer" == [yY] ]] || exit 1
  installer="$(mktemp)"
  trap 'rm -f "$installer"' EXIT
  curl --fail --location --show-error --silent https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh -o "$installer"
  /bin/bash "$installer"
  rm -f "$installer"
  trap - EXIT
fi

# Use the discovered brew binary so PATH is set consistently on Apple Silicon
# and Intel Macs (and so the bootstrap can be tested without a real install).
eval "$("$(command -v brew)" shellenv)"
command -v brew >/dev/null || { echo "Homebrew is not available in PATH." >&2; exit 1; }

# Do not run `brew bundle cleanup`: unrelated packages may belong to other projects.
brew bundle install --file "$ROOT/Brewfile" --no-upgrade

# Prevent Stow from folding entire config directories into symlinks: apps may
# generate runtime state beside their settings. Existing files are backed up.
backup="$HOME/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)-$$"
# Ghostty loads the old `config` name and macOS Application Support after
# ~/.config/ghostty/config.ghostty; retire them so they cannot override it.
for legacy_ghostty in "$HOME/.config/ghostty/config" "$HOME/Library/Application Support/com.mitchellh.ghostty/config.ghostty"; do
  if [[ -e "$legacy_ghostty" || -L "$legacy_ghostty" ]]; then
    destination="$backup/${legacy_ghostty#"$HOME/"}"
    mkdir -p "$(dirname "$destination")"
    mv "$legacy_ghostty" "$destination"
    echo "Backed up $legacy_ghostty -> $destination"
  fi
done
for package in config home; do
  if [[ "$package" == config ]]; then target_root="$HOME/.config"; else target_root="$HOME"; fi
  while IFS= read -r -d '' source; do
    relative="${source#"$ROOT/$package/"}"
    target="$target_root/$relative"
    if [[ -L "$target" ]]; then
      # Do not replace links to other repos or machines.
      if [[ ! "$target" -ef "$source" ]]; then
        echo "Conflicting symlink: $target (resolve it manually)." >&2
        exit 1
      fi
    elif [[ -e "$target" ]]; then
      destination="$backup/${target#"$HOME/"}"
      mkdir -p "$(dirname "$destination")"
      mv "$target" "$destination"
      echo "Backed up $target -> $destination"
    fi
  done < <(find "$ROOT/$package" -type f -print0)
done

mkdir -p "$HOME/.config"
cd "$ROOT"
stow --no-folding --target="$HOME/.config" config
stow --no-folding --target="$HOME" home

# Let Pi own settings.json; install only our pinned package, not local settings.
if ! pi list 2>/dev/null | grep -Fq 'git:github.com/NhanChau2409/pi-workbench@v0.5.1'; then
  pi install git:github.com/NhanChau2409/pi-workbench@v0.5.1
fi

echo "Ready. Restart Pi to load its package; open Karabiner/AeroSpace to grant macOS permissions."
