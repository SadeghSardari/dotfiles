#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -alH'

alias sb='source ~/.bashrc'
alias eb='vim ~/.bashrc'

alias tn='tmux new'
alias tls='tmux ls'

alias ga='git add'
alias gst='git status'
alias gdc='git diff --cached'
alias gcmsg='git commit -m'
alias gp='git push'
alias gpl='git pull'

alias xbl='xbacklight -get'

PS1='[\u@\h \W]\$ '
