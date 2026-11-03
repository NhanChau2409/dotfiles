# Completion cache is disposable and kept outside the configuration directory.
autoload -Uz compinit
compinit -d "$ZSH_CACHE_DIR/zcompdump-${ZSH_VERSION}"
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
