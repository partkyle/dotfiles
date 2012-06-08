zstyle ':completion:*' completer _expand _complete _correct _approximate

# matches case insensitive for lowercase
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending

# add menu selecting with the cursor
zstyle ':completion:*:*:*:*:*' menu select

# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending

# colors
zstyle ':completion:*' list-colors ''
