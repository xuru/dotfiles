#!/usr/bin/env bash
#  vim: set ts=4 sw=4 tw=80 syntax=sh :
#

# Make vim the default editor.
export EDITOR='vim';
export GIT_EDITOR='vim'
export SVN_EDITOR='vim'

# Enable persistent REPL history for `node`.
export NODE_REPL_HISTORY=~/.node_history;

# Allow 32³ entries; the default is 1000.
export NODE_REPL_HISTORY_SIZE='32768';

# Use sloppy mode by default, matching web browsers.
export NODE_REPL_MODE='sloppy';

# Make Python use UTF-8 encoding for output to stdin, stdout, and stderr.
export PYTHONIOENCODING='UTF-8';

# Increase Bash history size. Allow 32³ entries; the default is 500.
# see history.bash

# Prefer US English and use UTF-8.
export LANG='en_US.UTF-8';
export LC_ALL='en_US.UTF-8';

# Highlight section titles in manual pages.
export LESS_TERMCAP_md="${yellow}";

# Don’t clear the screen after quitting a manual page.
export MANPAGER='less -X';

# some bash-it stuff, but general exports as well...
# ---------------------------------------------------
# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='xuru@github.com'

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
