# macOS dotfiles

This repository records **selected user settings**, not every file on the machine. GNU Stow links `config/` into `~/.config/` and `home/` into `~/`. `Brewfile` declares direct Homebrew tools and apps; Homebrew installs dependencies automatically. [Cheatsheet](cheatsheet.typ) (Typst source; no PDF needed).

## New Mac

1. Install Apple's command-line tools (`xcode-select --install`) if necessary, and clone this repository into `~/personal/dotfiles`.
2. Review `Brewfile`, `config/`, `home/`, and `scripts/bootstrap.sh` before running it.
3. Run `./scripts/bootstrap.sh` from any directory. If Homebrew is absent, it prompts before downloading and running the official installer. Then it runs `brew bundle install --no-upgrade`, backs up conflicting **files** to `~/.dotfiles-backup/<timestamp>/`, and Stow-links the curated configs. It seeds new Pi settings and installs the pinned Pi package if needed. Existing Pi settings are left untouched.
4. Sign in to services manually (Pi auth, GitHub, cloud tools); grant requested macOS accessibility/input-monitoring permissions to window/keyboard apps. Start a new shell or Pi session to load changes.

On an existing Mac, **review the changes and backups carefully**. Never run `brew bundle cleanup` unless you intend to uninstall unrelated tools. The bootstrap does not remove other applications, use `sudo` unattended, or restore credentials. Re-running it is intended to be safe; if an existing symlink points somewhere else it stops and asks you to resolve the conflict.

## Why this layout

`config/` mirrors `~/.config/`; `home/` mirrors other home paths. Stow links each file without duplicating it, so editing either path updates the same config. Keep install choices in `Brewfile`, safe settings here, and writable/secret application state outside Git. Pi plugins belong in `pi-workbench`, not this repo.

## Adding a tool or config

1. Add a Homebrew formula/cask to `Brewfile` if applicable; locate the tool's *actual* config path.
2. Copy only safe, static config into `config/<tool>/...` (for `~/.config/<tool>/...`) or `home/<path>` (for `~/<path>`); exclude credentials and generated files.
3. Review/back up any existing target, then link via `stow --no-folding -t "$HOME/.config" config` or `stow --no-folding -t "$HOME" home` from this repo. The bootstrap handles backups on a fresh setup; manual Stow refuses conflicts.
4. Update [the cheatsheet](cheatsheet.typ) if you added aliases or bindings. Check the resulting symlink and restart/reload the tool.

## Locations

- `config/aerospace`, `config/karabiner`, `config/herdr`, `config/nvim`, `config/zsh`, `config/starship.toml` → matching paths in `~/.config/`.
- `home/.zshenv` → `~/.zshenv` (sets `ZDOTDIR=~/.config/zsh`).
- `home/Library/Application Support/com.mitchellh.ghostty/config.ghostty` → Ghostty's existing macOS application-support config. The current `~/.config/ghostty/config` is empty and intentionally not managed.
- `home/.pi/agent/AGENTS.md` → Pi's global agent guidance, including a reminder to update this repo for future tool/config changes.
- `pi-settings.example.json` → safe defaults only; Pi owns the writable `~/.pi/agent/settings.json`. The bootstrap seeds it only when absent. Do not symlink it or commit `auth.json`, model stores, sessions, trust decisions, or telemetry.

Pi **skills/extensions/themes/prompts** live in the separate canonical [pi-workbench](https://github.com/NhanChau2409/pi-workbench) package, installed by Pi from `git:github.com/NhanChau2409/pi-workbench@v0.5.1`. Update the pinned ref here after publishing a new tag there; do not Stow Pi's installed Git checkout. The existing standalone `~/.pi/agent/extensions/herdr-agent-state.ts` is not covered: review and migrate it to pi-workbench before treating a fresh Mac as fully equivalent.

Excluded intentionally: Herdr session/log/socket/lock files, Zsh history and session files, Neovim cache/plugins, Karabiner runtime state, auth tokens, SSH keys, and machine-specific cloud settings. The Karabiner config does contain a device identifier; adjust it for other keyboards. Neovim uses LazyVim and its committed plugin lockfile; plugins are installed on first use. Zsh uses Antidote; `plugins.txt` specifies its plugins. Some installed tools (e.g. `mise`, `gcloud-cli`) may have local credentials or independently managed settings that aren't included here.

To preview Stow against an **empty target**: `stow -n -v --no-folding -t "$HOME/.config" config`. On a configured Mac, this may report conflicts until existing files are backed up by the bootstrap. To unlink later: `stow -D --no-folding -t "$HOME/.config" config` and `stow -D --no-folding -t "$HOME" home` (from this repo).
