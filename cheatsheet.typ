// Dracula palette.
#let bg = rgb("#282a36")
#let panel = rgb("#383a4a")
#let ink = rgb("#f8f8f2")
#let muted = rgb("#b8bfd9")
#let cyan = rgb("#8be9fd")
#let violet = rgb("#bd93f9")

#set page(width: 170mm, height: 140mm, margin: 13mm, fill: bg)
#set text(font: "Helvetica Neue", size: 9pt, fill: ink)

#let key(label) = box(fill: rgb("#44475a"), radius: 4pt, inset: (x: 7pt, y: 4pt))[
  #text(font: "Helvetica Neue", size: 9pt, weight: "bold", fill: cyan)[#label]
]
#let line(keys, action) = block(width: 100%, fill: panel, radius: 6pt, inset: (x: 10pt, y: 7pt), above: 2pt, below: 2pt)[
  #grid(columns: (145pt, 1fr), column-gutter: 12pt, align: horizon, key(keys), [#action])
]

#text(font: "JetBrains Mono", size: 8pt, fill: rgb("#ff79c6"))[DOTFILES  /  KEYBOARD]
#v(6pt)
#text(size: 25pt, weight: "bold")[Karabiner]
#v(3pt)
#text(size: 9pt, fill: muted)[Tap for one key; hold for a modifier.]
#v(11pt)
#rect(width: 100%, height: 1pt, fill: rgb("#6272a4"))
#v(10pt)
#text(size: 9pt, weight: "bold", fill: violet)[KEY REMAPS]
#v(5pt)
#line("⇪ Caps Lock", "Tap → ⎋ Escape   ·   Hold → left ⌘ Command")
#line("Right ⇧ Shift", "Tap → ⌃ + B   ·   Hold → right ⌘ Command")
#line("Left ⇧ Shift", "Tap → ⌫ Delete   ·   Hold → left ⇧ Shift")

#v(13pt)
#rect(width: 100%, height: 1pt, fill: rgb("#6272a4"))
#v(8pt)
#text(size: 8pt, fill: muted)[EDIT  #text(font: "JetBrains Mono", fill: cyan)[config/karabiner/karabiner.json]]
