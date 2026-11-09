# macOS dotfiles

Homebrew installs tools; GNU Stow links curated settings into place. Review the [Brewfile](Brewfile) and [bootstrap script](scripts/bootstrap.sh) before running `./scripts/bootstrap.sh` (it backs up conflicting files, but authentication and macOS permissions remain manual).

## Layout

`config/` mirrors `~/.config/`; `home/` mirrors other paths under `~/`, so Stow can link settings without copies. `Brewfile` stays at the root for Homebrew's standard workflow, and `scripts/` holds setup actions.

Pi manages its own settings; the bootstrap installs the pinned [pi-workbench](https://github.com/NhanChau2409/pi-workbench) package, while credentials, caches, history, and machine-specific state stay out of Git.

## Config → symlink target

| Repo | Home |
| --- | --- |
| `config/aerospace/aerospace.toml` | `~/.config/aerospace/aerospace.toml` |
| `config/borders/bordersrc` | `~/.config/borders/bordersrc` |
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

## First launch and permissions

After bootstrap, launch each GUI tool once and approve the macOS prompts it needs:

1. Open **Karabiner-Elements** and complete its keyboard/driver permission setup.
2. Open **Homerow** and enable it in **System Settings → Privacy & Security → Accessibility**.
3. Open **AeroSpace** and enable launch at login after confirming its configuration works.
4. Start JankyBorders with `borders`; its managed config draws a rounded 5 px light-green glow around the focused window.

JankyBorders startup remains explicit so its appearance can be verified before enabling it permanently. macOS permissions remain manual and are intentionally not automated by the bootstrap script.

## Cheatsheet

### Homerow

Homerow is installed through the `homerow` Homebrew cask. It is free to try, with a reminder every 50 activations, and requires macOS Accessibility permission. Launch it from `/Applications/Homerow.app`, then grant permission in **System Settings → Privacy & Security → Accessibility**.

| Shortcut/action | Purpose |
| --- | --- |
| `⌥Space` | Activate Homerow and click UI elements |
| `⌥⌃Space` | Activate Homerow scroll mode; use `H/J/K/L` |
| Type a label, then `Return` | Click the matching element |
| `Tab` / `Control-N` | Focus the next element |
| `Shift-Tab` / `Control-P` | Focus the previous element |
| `Shift-Return` | Right-click |
| `Esc` | Exit Homerow |

These shortcuts are configured in Homerow’s preferences. Physically, use **Left Shift + Space** for `⌥Space`; use **Left Shift + Right Shift + Space** for `⌥⌃Space`. The current Karabiner profile turns held Left Shift into `⌥` and held Right Shift into `⌃`. Reapply these settings with [`scripts/configure-homerow.sh`](scripts/configure-homerow.sh).

### JankyBorders

| Setting | Value |
| --- | --- |
| Style | Rounded |
| Width | 5 px |
| Focused window | Light-green glow (`#b9f6ca`) |
| Inactive windows | Transparent |
| Rendering | HiDPI enabled |

Run `borders` to start it. After editing [`config/borders/bordersrc`](config/borders/bordersrc), run that file or restart `borders` to apply the appearance.

### LazyVim

| Shortcut | Action |
| --- | --- |
| `←/↓/↑/→` (Normal mode) | Focus the window in that direction |
| `⌃H/J/K/L` (LazyVim default) | Focus the window in that direction |

Karabiner converts **Right Control + H/J/K/L** into arrow keys before applications receive them. Mapping Normal-mode arrows to window focus lets that global navigation layer work naturally in LazyVim. Physical arrows behave the same way in Normal mode; arrows keep their standard cursor behavior in Insert and Command-line modes.

### Karabiner

| Shortcut | Action |
| --- | --- |
| `⌘⌃V` | Open Spotlight, then its Clipboard view (`⌘Space`, `⌘4`) |
| `⌃H/J/K/L` (Right Control) | Left/down/up/right arrow keys |

| Physical key | Tap | Hold with another key |
| --- | --- | --- |
| Caps Lock | Escape | Command (`⌘`) |
| Left Shift | Tab | Option (`⌥`) |
| Right Shift | Delete (Backspace) | Control (`⌃`) |
| Left Control | — | Control (`⌃`) |
| Left Option | — | Control (`⌃`) |
| Backtick (`` ` ``) | Backtick | Tab |
| Tab | Tab | Shift (`⇧`) |

Caps Lock, Left Shift, Right Shift, Backtick, and Tab use a 150 ms tap-alone timeout. Tap Backtick for `` ` `` or hold it alone for 150 ms to hold Tab; tap Tab for Tab or hold it as Shift. The `⌘⌃V` clipboard shortcut is a trial binding and may need a delay if Spotlight does not open before `⌘4`; holding one while pressing another key activates its hold behavior without waiting 150 ms. Physical Left Option emits Left Control immediately; Left Control, Right Control, and both physical Command keys remain unchanged. No Space or Enter remapping is configured.

### AeroSpace

AeroSpace uses 4 px inner gaps and 2 px outer gaps. Workspace `0` is reserved for the secondary monitor (falling back to the main monitor when only one is connected), so it cannot be moved with `⌥⌃Tab`. `⌥` is available by holding physical Left Shift; `⌃` is available from physical Left Option, Left Control, or Right Shift. These are all configured bindings in **main mode**:

| Category | Shortcut | Action |
| --- | --- | --- |
| Windows | `⌥ H/J/K/L` | Focus left/down/up/right |
| | `⌥⌃ H/J/K/L` | Move window left/down/up/right within the workspace |
| Workspaces | `⌥ 0–9` | Summon workspace to the focused monitor and switch to it |
| | `⌥⌃ 0–9` | Move the current window to that workspace and follow it |
| Monitors | `⌥ Tab` | Focus the next monitor (wraps around; toggles with two monitors) |
| | `⌥⌃ Tab` | Move the current workspace to the next monitor (wraps around) |
| Layout | `⌥ /` | Cycle tiled horizontal/vertical layouts |
| | `⌥ ,` | Cycle accordion horizontal/vertical layouts |
| Resize | `⌥ -` / `⌥ =` | Shrink / grow the focused window by 50 |
| Service | `⌥⌃ ;` | Enter service mode |

In **service mode** (press `⌥⌃ ;` first):

| Shortcut | Action |
| --- | --- |
| `Esc` | Reload config; return to main mode |
| `R` | Flatten workspace tree; return to main mode |
| `F` | Toggle floating/tiling; return to main mode |
| `Backspace` | Close all windows but the current one; return to main mode **(destructive)** |
| `⌥⌃ H/J/K/L` | Join with a window left/down/up/right; return to main mode |

There are no A–Z or workspace 10 shortcuts. Only `0–9` are persistent; a window left on another named workspace can still keep it alive. The complete settings are in [`config/aerospace/aerospace.toml`](config/aerospace/aerospace.toml) and [`config/karabiner/karabiner.json`](config/karabiner/karabiner.json).
