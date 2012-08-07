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
      echo "${b##refs/heads/}$r"
    fi
  fi
}

prompt-uber() {
  directory_name() {
    echo "%{$fg[cyan]%}${PWD/#$HOME/~}%{$reset_color%}"
  }

  git_prompt() {
    GIT_PROMPT=$(git_prompt_quick)
    if [ -n "$GIT_PROMPT" ]; then
      echo " %{$fg[yellow]%}$GIT_PROMPT%{$reset_color%}"
    fi
  }

  prompt_color() {
    if [[ -n $SSH_CONNECTION ]]; then
      echo "%{$fg_bold[magenta]%}"
    else
      echo "%{$fg[green]%}"
    fi
  }

  host_name() {
    echo " $(prompt_color)%m%{$reset_color%}"
  }

  export PROMPT=" $(prompt_color)%# %{$reset_color%}"
  export RPROMPT='$(directory_name)$(git_prompt)$(host_name)'
}

prompt-simple() {
  git_prompt() {
    GIT_PROMPT=$(git_prompt_quick)
    if [ -n "$GIT_PROMPT" ]; then
      echo "[$GIT_PROMPT]"
    fi
  }
  export PROMPT='${PWD/#$HOME/~}$(git_prompt)%# '
  export RPROMPT=""
}

prompt-uber
