# vim: set ts=4 sw=4 tw=80 syntax=sh :
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

export CLICOLORS=1
if [ -e /bin/dircolors ]; then
    eval $(dircolors -b ~/.dir_colors)
fi

# Set architecture flags
export ARCHFLAGS="-arch x86_64"

# set language, and make sure we can handle unicode
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
# ... and ignore same sucessive entries.
export HISTCONTROL=ignoreboth
export HISTIGNORE="&:[bf]g:exit"
export HISTFILESIZE=10000
export HISTSIZE=10000

# common exports
export INPUTRC=/etc/inputrc
export EDITOR=vim
export VISUAL=vim
export PAGER=less
export MANPAGER=less
export IGNOREEOF=3

# less and man page colors
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

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

## Source any local additions
if [ -f ~/.bash_local ]; then
    . ~/.bash_local
fi

export BASHDIR="$HOME/.bash.d"
for file in $BASHDIR/*.bash; do
    . $file
done
