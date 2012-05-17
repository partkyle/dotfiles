# matches case insensitive for lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending

# add menu selecting with the cursor
zstyle ':completion:*:*:*:*:*' menu select

# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending

# colors
zstyle ':completion:*' list-colors ''
