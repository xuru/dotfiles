#!/usr/bin/env bash

source ${HOME}/.bash.d/functions.sh

export PATH="$PATH:$HOME/bin"

if [ -f "$HOME/.bash_local" ]; then
    source "$HOME/.bash_local"
fi

export BASHDIR="$HOME/.bash.d"
for file in $BASHDIR/*.bash; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done
unset file;
