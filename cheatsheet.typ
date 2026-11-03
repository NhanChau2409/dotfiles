#set page(paper: "a4", margin: 18mm)
#set text(size: 10pt)

= Mac setup — quick reference

This describes bindings in this repository, not app defaults. `Alt` = Option; `Ctrl` = Control. AeroSpace bindings are starters and work after its config is installed and the app is running.

== AeroSpace — windows and screens
- `Alt + H/J/K/L` — focus window left/down/up/right.
- `Alt + Shift + H/L` — focus monitor left/right.
- `Ctrl + Alt + Shift + H/L` — move focused window to monitor left/right.

== Karabiner — keyboard remaps
- `Caps Lock` tap → Escape; hold → left Command.
- `Right Shift` tap → `Ctrl + B`; hold → right Command.
- `Left Shift` tap → Backspace; hold → left Shift.

== Zsh — aliases and keys
- `ls`, `ll`, `la`, `tree` → eza with color, Git status and directories first (`ll` long listing; `la` shows hidden files; `tree` is a tree view). If eza is absent, `ls`/`ll`/`la` fall back to macOS ls.
- `cat` → bat with no pager/plain style, if installed.
- `grep` and `diff` → colored output, if supported.
- Up/Down arrows → search history for commands starting with what you typed (via Antidote history-substring-search plugin).
- Starship provides the prompt when installed; otherwise Zsh uses a basic prompt.

== Neovim and other tools
- Neovim uses LazyVim defaults; `lua/config/keymaps.lua` defines no additional active shortcuts. `lua/plugins/example.lua` is disabled. See LazyVim's keymap reference for its defaults.
- Herdr, Ghostty, Starship and Pi: this repo records settings but defines no custom shortcut mappings for them.

== Where to edit
- AeroSpace: `config/aerospace/aerospace.toml`
- Karabiner: `config/karabiner/karabiner.json`
- Zsh: `config/zsh/modules/aliases.zsh` and `keybindings.zsh`
- Neovim: `config/nvim/lua/config/keymaps.lua`

After Stow links the files, editing either the repo path or its destination edits the same file. Update this sheet when you add a binding or alias.
