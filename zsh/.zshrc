
# source plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 
source ~/.config/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh  
source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/plugins/powerlevel9k/powerlevel9k.zsh-theme

# source config files

source ~/.config/zsh/bindkey.zsh
source ~/.config/zsh/colors.zsh
source ~/.config/zsh/setopt.zsh
source ~/.config/zsh/aliases.zsh
source ~/.config/zsh/termtitle.zsh
source ~/.config/zsh/pl9kprompt.zsh


# history settings
HISTFILE=~/.zhistory
HISTSIZE=5000
SAVEHIST=5000


# variables
export BROWSER="firefox"
export EDITOR="nano"


#zstyle :compinstall filename '/home/vy246/.zshrc'

autoload -Uz compinit promptinit
compinit
promptinit

prompt redhat


# completion
zstyle ':completion:*' menu select

# connect MPD to unix socket
export MPD_HOST=/home/vy246/.config/mpd/socket

