#!/usr/bin/env bash
# vim: set ts=4 sw=4 tw=80 syntax=sh
set +e

source ${HOME}/.bash.d/functions.sh

########################################
# Setup basic settings
########################################

# alot of these are for bashit, but are generic enough...
#
# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='xuru@github.com'

# Set my editor, svn, and git editor
export EDITOR="vim"
export GIT_EDITOR='vim'
export SVN_EDITOR='vim'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli
export TODO="tasks"

# Set Xterm/screen/Tmux title with only a short hostname.
# Uncomment this (or set SHORT_HOSTNAME to something else),
# Will otherwise fall back on $HOSTNAME.
export SHORT_HOSTNAME=$(hostname -s)

# Set Xterm/screen/Tmux title with only a short username.
# Uncomment this (or set SHORT_USER to something else),
# Will otherwise fall back on $USER.
export SHORT_USER=${USER:0:8}

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true
export SCM_GIT_SHOW_MINIMAL_INFO=true

# Set Xterm/screen/Tmux title with shortened command and directory.
export SHORT_TERM_LINE=true


# Case insensitive string comparison
shopt -s nocaseglob

ECHO=echo
OS=
ARCH=

find_os
find_architecture

