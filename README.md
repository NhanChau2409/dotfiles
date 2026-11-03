# macOS dotfiles

Homebrew installs tools; GNU Stow links curated settings into place. Review the [Brewfile](Brewfile) and [bootstrap script](scripts/bootstrap.sh) before running `./scripts/bootstrap.sh` (it backs up conflicting files, but authentication and macOS permissions remain manual).

## Layout

`config/` mirrors `~/.config/`; `home/` mirrors other paths under `~/`, so Stow can link settings without copies. `Brewfile` stays at the root for Homebrew's standard workflow, `scripts/` holds setup actions, and `docs/` keeps Typst source beside its PDF and preview.

Pi manages its own settings; the bootstrap installs the pinned [pi-workbench](https://github.com/NhanChau2409/pi-workbench) package, while credentials, caches, history, and machine-specific state stay out of Git.

## Config → symlink target

| Repo | Home |
| --- | --- |
| `config/aerospace/aerospace.toml` | `~/.config/aerospace/aerospace.toml` |
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

## Cheatsheet

[Open the PDF](docs/cheatsheet.pdf) · [Edit the Typst source](docs/cheatsheet.typ)

[![Karabiner keyboard remaps cheatsheet](docs/cheatsheet.png)](docs/cheatsheet.pdf)
