# OrbStack-provided Docker and Kubernetes clients
export PATH="$HOME/.orbstack/bin:$PATH"

# Generated cache and persistent state
typeset -g ZSH_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/zsh"
typeset -g ZSH_STATE_DIR="${XDG_STATE_HOME:-$HOME/.local/state}/zsh"

[[ -d "$ZSH_CACHE_DIR" ]] || mkdir -p -m 700 -- "$ZSH_CACHE_DIR"
[[ -d "$ZSH_STATE_DIR" ]] || mkdir -p -m 700 -- "$ZSH_STATE_DIR"
