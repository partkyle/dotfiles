alias reload!='. ~/.zshrc && echo "Shoot outside the screen!"'
alias :q='exit'

# lgst, since I type it all the time
alias lgst='git status; ls'

# noglob fixes
alias  curl='nocorrect curl'
alias  echo='nocorrect echo'
alias  find='nocorrect find'
alias  grep='nocorrect grep'
alias egrep='nocorrect egrep'
alias fgrep='nocorrect fgrep'
alias   ack='nocorrect ack'

# grep colors
alias  grep='nocorrect grep --color=auto'
alias egrep='nocorrect egrep --color=auto'
alias fgrep='nocorrect fgrep --color=auto'
