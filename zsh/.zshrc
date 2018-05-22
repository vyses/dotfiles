
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

# compinit
autoload -Uz compinit
compinit

# completion
zstyle ':completion:*' menu select
_comp_options+=(globdots)

# connect MPD to unix socket
export MPD_HOST=~/.config/mpd/socket

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
(cat ~/.cache/wal/sequences &)

# Add wal support for TTYs
source ~/.cache/wal/colors-tty.sh
