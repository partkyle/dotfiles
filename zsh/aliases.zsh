#
# util aliases
#

alias reload!='. ~/.zshrc && echo "Shoot outside the screen!"'
alias :q='exit'

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

#
# git aliases

alias g='git'
alias gs='git status -sb' # upgrade your git if -sb breaks for you. it's fun.
alias gst='git status'
alias grm="git status | grep deleted | awk '{print \$3}' | xargs git rm"

# lgst, since I type it all the time
alias lgst='git status; ls'

#
# ruby aliases
#

# pow restart
alias rst='touch tmp/restart.txt'

# bundler
alias be='bundle exec'
alias bi='bundle install'
alias bu='bundle update'
