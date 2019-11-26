#!/usr/bin/env bash
source ${HOME}/.dotfiles/.bash.d/scripts/functions.sh



function dir_exists() {
    [[ -d "$1" ]]
}


function link_dir() {
    local homedir="${HOME}/$1"
    local dotdir="${HOME}/.dotfiles/$1"

    if [[ -d "$homedir" && ! -h "$homedir" ]]; then
        echo "Dir exists: ${homedir}"
        if [[ -d "${homedir}.orig" ]]; then
            rm -rf "${homedir}.orig"
        fi
        mv -f ${homedir} "${homedir}.orig"
    else
        echo "Dir !exists: ${homedir}"
    fi
    ln -s "${dotdir}" "${homedir}"
}


link_dir bin
link_dir .vim
link_dir .pip
link_dir .config
link_dir .bash.d
