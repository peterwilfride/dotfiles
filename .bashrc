#
# ~/.bashrc
#

# Aliases definitions
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Change the window title of X terminals
case ${TERM} in

	*kitty|xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|interix|konsole*)
		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
		;;
	screen*)
		PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
		;;
esac

# GIT-BRANCH FUNCTION
function parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

function gitPS1(){
    gitps1=$(parse_git_branch)
    length=${#gitps1}

    if [ $length -ne 0 ]; then
        echo "$gitps1"
    else
        echo ""
    fi
}

# PS1 VARIABLE
PS1="\[\033[01;32m\]\u \[\033[01;35m\]\W \[\033[02;31m\]\$(gitPS1)\[\033[01;32m\]\$\[\033[00m\] "


# EXPORTS
export VISUAL=vim;
export EDITOR=vim;
export LESSHISTFILE="-"
#export QT_QPA_PLATFORMTHEME=qt5ct

pomo() {
    arg1=$1
    shift
    args="$*"

    min=${arg1:?Example: pomo 15 Take a break}
    sec=$((min * 60))
    msg="${args:?Example: pomo 15 Take a break}"

    while true; do
        date '+%H:%M' && sleep "${sec:?}" && notify-send -u critical -t 0 -a pomo "${msg:?}"
    done
}

PATH=$PATH:~/.local/bin
