# use compinit to make auto-completion available
# http://zsh.sourceforge.net/Doc/Release/Completion-System.html
autoload -Uz compinit
compinit
# make colors available
autoload -U colors
colors

# set up ASDF
# https://asdf-vm.com/#/
export ASDF_DIR=$HOME/.asdf
. $ASDF_DIR/asdf.sh
# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit

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
# don't let python write *.pyc files
export PYTHONDONTWRITEBYTECODE=1

# ALIASES
alias ga="git add"
alias gd="git diff -w"
alias gs="git status"
alias gc="git commit"

# Export NPM token
export NODE_AUTH_TOKEN=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

# Android Studio settings
export ANDROID_HOME=$HOME/Library/Android/sdk
export ANDROID_SDK=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$HOME/.cargo/bin
export HOMEBREW_GITHUB_API_TOKEN=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

# update PATH for homebrew and rbenv
export PATH=".bundle/bin:/usr/local/bin:/usr/local/sbin:$HOME/.rbenv/bin:$PATH"

# rbenv
eval "$(rbenv init - zsh)"

# pnpm
export PNPM_HOME="/Users/daniel.corrigan/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end