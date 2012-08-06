alias reload!='. ~/.zshrc && echo "Shoot outside the screen!"'
alias :q='exit'

# noglob fixes
alias  curl='noglob curl'
alias  echo='noglob echo'
alias  find='noglob find'
alias  grep='noglob grep'
alias egrep='noglob egrep'
alias fgrep='noglob fgrep'
alias   ack='noglob ack'

# grep colors
alias  grep='noglob grep --color=auto'
alias egrep='noglob egrep --color=auto'
alias fgrep='noglob fgrep --color=auto'
