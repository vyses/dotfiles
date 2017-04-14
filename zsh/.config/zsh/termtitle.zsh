# Window title

case $TERM in
  termite|*xterm*|rxvt|rxvt-unicode|rxvt-256color|rxvt-unicode-256color|(dt|k|E)term)
    precmd () {print -Pn "\e]0;%~\a"}
    ;;
esac

