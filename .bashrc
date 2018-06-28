#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -alH'

alias sb='source ~/.bashrc'
alias eb='nvim ~/.bashrc'

alias tn='tmux new'
alias tls='tmux ls'

alias ga='git add'
alias gst='git status'
alias gdc='git diff --cached'
alias gcmsg='git commit -m'
alias gp='git push'
alias gpl='git pull'

alias x='startx'
alias xbl='xbacklight -get'

alias dcm='clipdel -d .*'

recwc() {
  ffmpeg -f v4l2 -video_size 640x480 -i /dev/video0 -f alsa -i default -c:v libx264 -preset ultrafast -c:a aac $1
}

[[ $TMUX != "" ]] && export TERM="screen-256color"

PS1='[\u@\h \W]\$ '
