// Dracula palette.
#let bg = rgb("#282a36")
#let panel = rgb("#383a4a")
#let ink = rgb("#f8f8f2")
#let cyan = rgb("#8be9fd")

#set page(width: 170mm, height: 100mm, margin: 13mm, fill: bg)
#set text(font: "Helvetica Neue", size: 9pt, fill: ink)

#let key(label) = box(fill: rgb("#44475a"), radius: 4pt, inset: (x: 7pt, y: 4pt))[
  #text(font: "Helvetica Neue", size: 9pt, weight: "bold", fill: cyan)[#label]
]
#let line(keys, action) = block(width: 100%, fill: panel, radius: 6pt, inset: (x: 10pt, y: 7pt), above: 3pt, below: 3pt)[
  #grid(columns: (145pt, 1fr), column-gutter: 12pt, align: horizon, key(keys), [#action])
]

#text(size: 25pt, weight: "bold")[Cheatsheet]
#v(7pt)
#text(size: 11pt, weight: "bold", fill: rgb("#bd93f9"))[Karabiner]
#v(14pt)
#line("⇪ Caps Lock", "Tap → ⎋ Escape   ·   Hold → ⌘ Command")
#line("Right ⇧ Shift", "Tap → ⌃ Ctrl + B   ·   Hold → ⌘ Command")
#line("Left ⇧ Shift", "Tap → ⌫ Delete   ·   Hold → ⇧ Shift")
