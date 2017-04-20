#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


# prompt
PS1='[\u@\h \W]\$ '

# append to the history file, don't overwrite it
shopt -s histappend

# limit history length and file size
HISTSIZE=5000
HISTFILESIZE=2000

# connect MPD to unix socket
export MPD_HOST=~/.config/mpd/socket

# source fzf keybindings/bash completion
source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash

# aliases
alias ls='ls --color=auto'
alias reboot='sudo systemctl reboot'
alias poweroff='sudo systemctl poweroff'
alias wifi-menu='sudo wifi-menu'

## Modified commands
alias grep='grep --color=auto'
alias more='less'
alias df='df -h'
alias du='du -c -h'
alias mkdir='mkdir -p -v'
alias nano='nano -w'
alias ping='ping -c 5'
alias dmesg='dmesg -HL'

## pacman
alias pacs="sudo pacman -S"
alias pacup="sudo pacman -Syu"
alias pacf="pacman -Ss"
alias pacq="pacman -Q"

## ls
alias ls='ls -hF --color=auto'

## safety features
alias cp='cp -i'
alias mv='mv -i '
alias rm='rm -i'
