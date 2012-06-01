autoload colors && colors
# cheers, @ehrenmurdick
# http://github.com/ehrenmurdick/config/blob/master/zsh/prompt.zsh

git_prompt_quick() {
  local g="$(git rev-parse --git-dir 2>/dev/null)"
  if [ -n "$g" ]; then
    local r
    local b
    if [ -d "$g/../.dotest" ]
    then
      if test -f "$g/../.dotest/rebasing"
      then
        r="|REBASE"
      elif test -f "$g/../.dotest/applying"
      then
        r="|AM"
      else
        r="|AM/REBASE"
      fi
      b="$(git symbolic-ref HEAD 2>/dev/null)"
    elif [ -f "$g/.dotest-merge/interactive" ]
    then
      r="|REBASE-i"
      b="$(cat "$g/.dotest-merge/head-name")"
    elif [ -d "$g/.dotest-merge" ]
    then
      r="|REBASE-m"
      b="$(cat "$g/.dotest-merge/head-name")"
    elif [ -f "$g/MERGE_HEAD" ]
    then
      r="|MERGING"
      b="$(git symbolic-ref HEAD 2>/dev/null)"
    else
      if [ -f "$g/BISECT_LOG" ]
      then
        r="|BISECTING"
      fi
      if ! b="$(git symbolic-ref HEAD 2>/dev/null)"
      then
        if ! b="tag: $(git describe --exact-match HEAD 2>/dev/null)"
        then
          b="$(cut -c1-7 "$g/HEAD")..."
        fi
      fi
    fi

    if [ -n "$1" ]; then
      echo "$1" "${b##refs/heads/}$r"
    else
      echo "%{$fg[yellow]%}%s" "${b##refs/heads/}$r"
    fi
  fi
}

directory_name() {
  echo "%{$fg_bold[cyan]%}${PWD/#$HOME/~}%{$reset_color%}"
}

prompt_color() {
  if [[ "`uname`" == 'Darwin' ]]; then
    echo "%{$fg[green]%}"
  elif [[ "$HOST" == 'sendgrid' ]]; then
    echo "%{$fg_bold[magenta]%}"
  else
    echo "%{$fg[blue]%}"
  fi
}

host_name() {
  echo "$(prompt_color)%m%{$reset_color%}"
}

export PROMPT=" $(prompt_color)%%› %{$reset_color%}"
set_prompt () {
  export RPROMPT="$(directory_name)$(git_prompt_quick) $(host_name)"
}

precmd() {
  title "zsh" "%m" "%55<...<%~"
  set_prompt
}
