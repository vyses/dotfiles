# aliases
alias ls='ls --color=auto'
alias reboot='sudo systemctl reboot'
alias poweroff='sudo systemctl poweroff'
alias wifi-menu='sudo wifi-menu'

## modified commands
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
alias mv='mv -i'
alias rm='rm -i'

