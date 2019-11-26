#!/usr/bin/env bash
#  vim: set ts=4 sw=4 tw=80 syntax=sh :
#
if installed direnv; then
    eval "$(direnv hook bash)"

    show_virtual_env() {
        if [[ -n "$VIRTUAL_ENV" ]]; then
            virtualenv=`basename "$VIRTUAL_ENV"`
            echo "($virtualenv) "
        fi
    }
    PS1='($(show_virtual_env))'$PS1
fi

