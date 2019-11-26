#!/usr/bin/env bash
#  vim: set ts=4 sw=4 tw=80 syntax=sh :
#
# https://unix.stackexchange.com/a/48116
export HISTSIZE=10000
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignorespace:ignoredups

_bash_history_sync() {
    builtin history -a         #1
    HISTFILESIZE=$HISTSIZE     #2
    builtin history -c         #3
    builtin history -r         #4
}

history() {                  #5
    _bash_history_sync
    builtin history "$@"
}

PROMPT_COMMAND=_bash_history_sync
