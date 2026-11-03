#let bg = rgb("#0b1220")
#let panel = rgb("#172235")
#let ink = rgb("#e2e8f0")
#let muted = rgb("#95a6bc")
#let cyan = rgb("#67e8f9")
#let violet = rgb("#c4b5fd")

#set page(paper: "a4", margin: (x: 20mm, y: 17mm), fill: bg)
#set text(font: "Helvetica Neue", size: 9pt, fill: ink)
#set par(leading: 0.55em)

#let key(label) = box(fill: rgb("#233b50"), radius: 4pt, inset: (x: 7pt, y: 4pt))[
  #text(font: "JetBrains Mono", size: 8.1pt, weight: "bold", fill: cyan)[#label]
]
#let line(keys, action) = block(width: 100%, fill: panel, radius: 6pt, inset: (x: 10pt, y: 7pt), above: 2pt, below: 2pt)[
  #grid(columns: (190pt, 1fr), column-gutter: 12pt, align: horizon, key(keys), [#action])
]
#let section(label) = {
  v(11pt)
  text(size: 9pt, weight: "bold", fill: violet)[#label]
  v(4pt)
}

#text(font: "JetBrains Mono", size: 8pt, fill: cyan)[DOTFILES  /  QUICK REFERENCE]
#v(8pt)
#text(size: 26pt, weight: "bold")[Keyboard & CLI]
#v(3pt)
#text(size: 9pt, fill: muted)[Bindings in this repo · Option = Alt · Control = Ctrl]
#v(11pt)
#rect(width: 100%, height: 1pt, fill: rgb("#314255"))

#section("01  AEROSPACE  /  WINDOWS")
#line("Alt + H / J / K / L", "Focus window  ←  ↓  ↑  →")
#line("Alt + Shift + H / L", "Focus monitor  ←  →")
#line("Ctrl + Alt + Shift + H / L", "Move window to monitor  ←  →")

#section("02  KARABINER  /  REMAPS")
#line("Caps Lock  tap / hold", "Escape / left Command")
#line("Right Shift  tap / hold", "Ctrl + B / right Command")
#line("Left Shift  tap / hold", "Backspace / left Shift")

#section("03  ZSH  /  ALIASES & HISTORY")
#line("ls  ·  ll  ·  la  ·  tree", "eza listings; long / hidden / tree")
#line("cat", "bat without paging (when installed)")
#line("grep  ·  diff", "Colored output when supported")
#line("↑  /  ↓", "Search history matching typed prefix")

#section("04  EDITOR & PROMPT")
#line("Neovim", "LazyVim defaults; no extra active keymaps")
#line("Starship", "Shell prompt; basic Zsh fallback")

#v(14pt)
#rect(width: 100%, height: 1pt, fill: rgb("#314255"))
#v(8pt)
#text(size: 8pt, fill: muted)[EDIT IN  #text(font: "JetBrains Mono", fill: cyan)[config/aerospace · config/karabiner · config/zsh · config/nvim]]
#v(3pt)
#text(size: 8pt, fill: muted)[AeroSpace requires installation; after Stow links configs, both paths refer to the same file.]
