# use compinit to make auto-completion available
# http://zsh.sourceforge.net/Doc/Release/Completion-System.html
autoload -Uz compinit
compinit
# make colors available
autoload -U colors
colors

# set up ASDF
# https://asdf-vm.com/#/
export ASDF_DIR=$(brew --prefix asdf)
export ASDF_COMPLETIONS="$ASDF_DIR/etc/bash_completion.d"
. $ASDF_DIR/asdf.sh
. $ASDF_COMPLETIONS/asdf.bash

# set up tmuxinator 
# https://github.com/tmuxinator/tmuxinator
source ~/.bin/tmuxinator.zsh

# set PS1
git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null)
  if [[ -n $ref ]]; then
    echo " %{$fg_bold[green]%}${ref#refs/heads/}%{$reset_color%}"
  fi
}
setopt promptsubst
export PS1='${SSH_CONNECTION+"%{$fg_bold[green]%}%n@%m:"}%{$fg_bold[blue]%}%c%{$reset_color%}$(git_prompt_info) %# '

## IMPORTANT EXPORTS
# don't let homebrew upgrade other packages without asking
export HOMEBREW_NO_AUTO_UPDATE=1

# ALIASES
alias ga="git add"
alias gd="git diff -w"
alias gs="git status"
alias gc="git commit"
