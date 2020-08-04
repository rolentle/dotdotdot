# Store 10,000 history entries
export HISTSIZE=10000
# Don't store duplicates
export HISTCONTROL=erasedups
VISUAL=nvim
EDITOR="$VISUAL"
LESS="FRX"
RI="--format ansi -T"
PSQL_EDITOR='vim -c"setf sql"'
CLICOLOR=1
LSCOLORS=gxgxcxdxbxegedabagacad

export VISUAL EDITOR LESS RI PSQL_EDITOR CLICOLOR LSCOLORS

export HISTIGNORE="%*"

plugins=(
  p10k
)

# [ -z "$PS1" ] || stty -ixon

# prefix=
# if [ -n "$SSH_CONNECTION" ]; then
#   prefix="\[\033[01;33m\]\u@\h"
# else
#   prefix="\[\033[01;32m\]\u@\h"
# fi

# [ -z "$PS1" ] || export PS1="$prefix\[\033[00m\]:\[\033[01;36m\]\w\[\033[00m\]\$(git_prompt_info '(%s)')$ "

# if [ -f '/usr/local/etc/bash_completion.d/git-completion.bash' ]; then
#   source '/usr/local/etc/bash_completion.d/git-completion.bash'
# fi

# [ ! -f "$HOME/.bashrc.local" ] || . "$HOME/.bashrc.local"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias tml='tmux ls'
alias tmn='tmux new -s'
alias tma='tmux attach -t'
alias gundo='git reset --soft HEAD~1'
alias grs='git rebase --skip'
alias gap='git add -p'
alias gnap='git add -N --ignore-removal . && gap'
alias glp='git log -p'
alias glg='git log --graph --oneline --decorate --color --all'
alias gb='git branch'
alias gc='git commit -v'
alias gca='git commit -a -v'
alias gcl='git clean -f -d'
alias gd='git diff'
alias gdc='git diff --cached'
alias gdh='git diff HEAD'
alias gl='git pull'
alias glod='git log --oneline --decorate'
# alias glod='git log --graph --pretty="%Cgreen%h%Creset%Cblue%d%Creset %Cred%an%Creset: %s"'
alias gp='git push'
alias gpr='git pull --rebase'
alias gst='git status'
alias gr='git rebase'
alias grc='git rebase --continue'
alias gra='git rebase --abort'
alias gco='git checkout'
alias reset-authors='git commit --amend --reset-author -C HEAD' 

ZSH_THEME="powerlevel10k/powerlevel10k"
