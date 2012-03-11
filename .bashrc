# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

export CLICOLORS=1
if [ -e /bin/dircolors ]; then
    eval $(dircolors -b ~/.dircolors)
fi

export LANG="C"
set HOSTNAME=`uname -n`

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
# ... and ignore same sucessive entries.
export HISTCONTROL=ignoreboth
export HISTIGNORE="&:[bf]g:exit"
export HISTFILESIZE=10000
export HISTSIZE=10000

export INPUTRC=/etc/inputrc
export EDITOR=vim
export VISUAL=vim
export BROWSER=firefox
export PAGER=less
export MANPAGER=less
export MAILCHECK=0
export MAIL=~/.mail
export IGNOREEOF=3

# less man page colors
export GROFF_NO_SGR=1
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'                                 
export LESS_TERMCAP_se=$'\E[0m'                           
export LESS_TERMCAP_us=$'\E[01;32m'
export LESS_TERMCAP_ue=$'\E[0m'

# grep colors
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;32'

function mkcd() { mkdir "$1" && cd "$1"; }
function calc(){ awk "BEGIN{ print $* }" ;}
function hex2dec { awk 'BEGIN { printf "%d\n",0x$1}'; }
function dec2hex { awk 'BEGIN { printf "%x\n",$1}'; }
function mktar() { tar czf "${1%%/}.tar.gz" "${1%%/}/"; }
function mkmine() { sudo chown -R ${USER} ${1:-.}; }
function rot13 () { echo "$@" | tr a-zA-Z n-za-mN-ZA-M; }
function :h () {  vim -c "silent help $@" -c "only"; }
function gril () { grep -rl "$@" *; }
function grepword () { grep -Hnr "$@" *; }
function vimf () { vim -c "ScratchFind" -c "only"; }
function vimg () { vim -c "ScratchFind 'grep -rl \"$@\" *'" -c "only"; }
function vfind () { vim -p $(find . -name '$@'); }

function sendkey () {
    if [ $# -eq 1 ]; then
        local key=""
        if [ -f ~/.ssh/id_dsa.pub ]; then
            key=~/.ssh/id_dsa.pub
        elif [ -f ~/.ssh/id_rsa.pub ]; then
            key=~/.ssh/id_rsa.pub
        else
            echo "No public key found" >&2
            return 1
        fi
        ssh $1 'cat >> ~/.ssh/authorized_keys' < $key
    fi
}
if [ "$TERM_PROGRAM" = "Apple_Terminal" -a "$TERM" = "vt100" ];then
    export TERM="screen"
fi

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

if [ "$TERM" = "linux" ]; then
    echo -en "\e]P0222222" #black
    echo -en "\e]P8222222" #darkgrey
    echo -en "\e]P1803232" #darkred
    echo -en "\e]P9982b2b" #red
    echo -en "\e]P25b762f" #darkgreen
    echo -en "\e]PA89b83f" #green
    echo -en "\e]P3aa9943" #brown
    echo -en "\e]PBefef60" #yellow
    echo -en "\e]P4324c80" #darkblue
    echo -en "\e]PC2b4f98" #blue
    echo -en "\e]P5706c9a" #darkmagenta
    echo -en "\e]PD826ab1" #magenta
    echo -en "\e]P692b19e" #darkcyan
    echo -en "\e]PEa1cdcd" #cyan
    echo -en "\e]P7ffffff" #lightgrey
    echo -en "\e]PFdedede" #white
    clear #for background artifacting
fi

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    if [ -z "$SSH_TTY" ]; then
        PS1='${debian_chroot:+($debian_chroot)}[\[\033[01;36m\]\@\[\033[00m\]]\[\033[01;32m\]\u\[\033[00m\]@\[\033[01;32m\]\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '
    else
        PS1='${debian_chroot:+($debian_chroot)}[\[\033[01;36m\]\@\[\033[00m\]]\[\033[01;32m\]\u\[\033[00m\]@\[\033[01;31m\]\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '
    fi
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    if [ "$HOSTNAME" != "kinglaptop36" ]; then
        export PROMPT_COMMAND='echo -ne "\033]2;$LOGNAME@$HOSTNAME   Directory: $PWD\007\033]1;$LOGNAME@$HOST\007"'
    else
        PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    fi
    ;;
*)
esac

# fix GTK
export GDK_NATIVE_WINDOWS=1

#Pango makes firefox hell slow
export MOZ_DISABLE_PANGO=1
export FIREFOX_DSP=none

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -e /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# Setup homebrew auto-completion on the Mac
if [ -e /usr/local/bin/brew ]; then
    if [ -f `brew --prefix`/etc/bash_completion ]; then
        . `brew --prefix`/etc/bash_completion
    fi
fi


if tty -s; then
    type -p motd >/dev/null && motd #run this neat little script
fi

export PATH=$PATH:${HOME}/bin
export PATH=$PATH:/usr/local/bin

################################################################################
# Python exports
################################################################################
export PYTHONPATH=$PYTHONPATH:${HOME}/lib/python:/usr/local/lib/python2.7/site-packages

################################################################################
# Subversion
################################################################################
export SVN_EDITOR=vim

if [ -e /usr/bin/meld ]; then
    export SVN_MERGE=/usr/bin/meld
    export SVN_DIFF=/usr/bin/meld
fi

# MacOS X with xcode installed
if [ -e /usr/bin/opendiff ]; then
    export SVN_MERGE=/usr/bin/opendiff
    export SVN_DIFF=/usr/bin/opendiff
fi

if [ -e ${HOME}/.cscope ]; then
    CSCOPE_DB=${HOME}/.cscope/cscope.out; export CSCOPE_DB   
fi

################################################################################
# Android
################################################################################
export PATH=${PATH}:/opt/AndroidSDK/tools

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

