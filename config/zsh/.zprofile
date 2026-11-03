# Login-shell environment
if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# User-installed command-line tools
typeset -U path PATH
path=("$HOME/.local/bin" $path)
