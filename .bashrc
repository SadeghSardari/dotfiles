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
alias gb='git branch'
alias glsr='git ls-remote'

alias x='startx'
alias xbl='xbacklight -get'
alias v='nvim .'
alias fa='ps aux | fzf'
alias fe='env | fzf'
alias ..='cd ..'
alias cs='nvim ~/Dropbox/cheatsheets/cheatsheet.txt'
alias note='cd ~/Dropbox/Notes/; nvim .'
alias skype='chromium --app=https://web.skype.com'
alias feh='feh --auto-rotate'

alias dcm='clipdel -d .*'
alias dsk='cd ~/Desktop'
alias dld='cd ~/Downloads'

alias mcv='sudo mount -t davfs http://localhost:42427/d6oJctVLQ7ep/V_Clairvision /mnt/clairvision -o username=${USER},rw,uid=${USER},gid=${USER},file_mode=700,dir_mode=700'

alias mid='sudo mount -t davfs http://localhost:42427/vRiAttE-SCoo/V_Identity /mnt/identity -o username=${USER},rw,uid=${USER},gid=${USER},file_mode=700,dir_mode=700'

alias mjo='sudo mount -t davfs http://localhost:42427/lQlCNWjUTuTQ/V_Journal /mnt/journal -o username=${USER},rw,uid=${USER},gid=${USER},file_mode=700,dir_mode=700'

# restart wifi
alias rwf='sudo systemctl restart wpa_supplicant@wlp4s0'

recwc() {
  ffmpeg -f v4l2 -video_size 640x480 -i /dev/video0 -f alsa -i default -c:v libx264 -preset ultrafast -c:a aac $1
}

[[ $TMUX != "" ]] && export TERM="screen-256color"

PS1='[\u@\h \W]\$ '

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# nvm
source /usr/share/nvm/init-nvm.sh
