# Plugin management
if [[ -r /opt/homebrew/opt/antidote/share/antidote/antidote.zsh ]]; then
  source /opt/homebrew/opt/antidote/share/antidote/antidote.zsh
  antidote load "$ZDOTDIR/plugins.txt" "$ZSH_CACHE_DIR/plugins.zsh"
fi
