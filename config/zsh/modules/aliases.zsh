# Colorful command output
if command -v eza >/dev/null 2>&1; then
  alias ls='eza --group-directories-first --git --color=always'
  alias ll='eza -lah --group-directories-first --git --color=always'
  alias la='eza -a --group-directories-first --git --color=always'
  alias tree='eza --tree --group-directories-first --git --color=always'
else
  alias ls='ls -G'
  alias ll='ls -lahG'
  alias la='ls -AG'
fi

if command -v bat >/dev/null 2>&1; then
  alias cat='bat --paging=never --style=plain'
fi

if grep --color=auto '' /dev/null >/dev/null 2>&1; then
  alias grep='grep --color=auto'
fi

if diff --color=auto /dev/null /dev/null >/dev/null 2>&1; then
  alias diff='diff --color=auto'
fi
