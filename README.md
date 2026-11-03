# macOS dotfiles

Homebrew installs tools; GNU Stow links curated settings into place. Review the [Brewfile](Brewfile) and [bootstrap script](scripts/bootstrap.sh) before running `./scripts/bootstrap.sh` (it backs up conflicting files, but authentication and macOS permissions remain manual).

## Layout

`config/` mirrors `~/.config/`; `home/` mirrors other paths under `~/`, so Stow can link settings without copies. `Brewfile` stays at the root for Homebrew's standard workflow, and `scripts/` holds setup actions.

Pi manages its own settings; the bootstrap installs the pinned [pi-workbench](https://github.com/NhanChau2409/pi-workbench) package, while credentials, caches, history, and machine-specific state stay out of Git.

## Config → symlink target

| Repo | Home |
| --- | --- |
| `config/ghostty/config.ghostty` | `~/.config/ghostty/config.ghostty` |
| `config/herdr/config.toml` | `~/.config/herdr/config.toml` |
| `config/karabiner/karabiner.json` | `~/.config/karabiner/karabiner.json` |
| `config/nvim/**` | `~/.config/nvim/**` |
| `config/zsh/**` | `~/.config/zsh/**` |
| `config/starship.toml` | `~/.config/starship.toml` |
| `home/.pi/agent/AGENTS.md` | `~/.pi/agent/AGENTS.md` |
| `home/.zshenv` | `~/.zshenv` |

## Add a tool

Add its Homebrew formula/cask to `Brewfile` if applicable, and put only safe, static settings under `config/<tool>/` or `home/<path>` to match the tool's actual config path. Back up any existing file before linking with Stow (or run the bootstrap), then update the cheatsheet if you added bindings or aliases.

## Keeping a Mac awake

The `caffeine` app is in `Brewfile`; macOS also includes `caffeinate` with no installation needed. Run `caffeinate -i pi` to prevent idle sleep while that Pi process runs—this does **not** keep Pi alive if its terminal closes, the Mac restarts, or power is lost.

## Cheatsheet

### Karabiner

| Key | Tap | Hold |
| --- | --- | --- |
| ⇪ Caps Lock | ⎋ Escape | ⌘ Command |
| Right ⇧ Shift | ⌃ Ctrl + B | ⌘ Command |
| Left ⇧ Shift | ⌫ Delete | ⇧ Shift |
