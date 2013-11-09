autoload colors && colors
# cheers, @ehrenmurdick
# http://github.com/ehrenmurdick/config/blob/master/zsh/prompt.zsh

if (( $+commands[git] ))
then
  git="$commands[git]"
else
  git="/usr/bin/git"
fi

# Host - Compressed and color-coded per host_repr array
# if not found, regular hostname in default color
prompt_host() {
  typeset -A host_repr
  host_repr=('gevans-laptop' 'macbook-pro')
  echo "@${host_repr[$(hostname)]:-$(hostname)}%{$reset_color%}"
}

# User - Color-coded by privileges
prompt_user() {
  echo "%(!.%{$fg[blue]%}.%{$fg[blue]%})%n%{$reset_color%}"
}

# Time - Color-coded by last return code
prompt_time() {
  echo "%(?.%{$fg[green]%}.%{$fg[red]%})%*%{$reset_color%}"
}

# Compacted $PWD
prompt_pwd() {
  echo "%{$fg[magenta]%}%c%{$reset_color%}"
}

prompt_ruby() {
  if (( $+commands[rbenv] ))
  then
    echo "$(rbenv version | awk '{print $1}')"
  fi

  if (( $+commands[rvm] ))
  then
    echo "$(rvm-prompt | awk '{print $1}')"
  fi
}

prompt_git() {
  ref=$(git symbolic-ref HEAD 2>/dev/null) || return

  dirty=$($git status 2>/dev/null | tail -n 1)
  color="%{$fg[black]%}"
  if [[ $dirty =~ ^nothing ]]
  then
    color="%{$fg[green]%}"
    dirty=""
  else
    color="%{$fg[yellow]%}"
    dirty="*"
  fi

  unpushed=$($git cherry -v @{upstream} 2>/dev/null)
  if [[ $unpushed != "" ]]
  then
    color="%{$fg[yellow]%}"
  fi

  echo "[${color}${ref#refs/heads/}%{$reset_color%}${dirty}]"
}

PROMPT=$'\n$(prompt_time) $(prompt_user)$(prompt_host):$(prompt_pwd) $(prompt_ruby)\n$(prompt_git) %% '
