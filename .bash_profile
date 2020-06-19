#!/usr/bin/env bash

source ${HOME}/.bash.d/scripts/functions.sh

export BASHDIR="$HOME/.bash.d"
for file in ${BASHDIR}/*.bash; do
    [[ -r "$file" ]] && [[ -f "$file" ]] && source "$file";
done
unset file;

# if we have a bash local file, let's add it
if [[ -f "$HOME/.bash_local" ]]; then
    source "$HOME/.bash_local"
fi

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"