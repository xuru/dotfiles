#!/usr/bin/env bash
#  vim: set ts=4 sw=4 tw=80 syntax=sh :
#
################################################################################
# python specific stuff
################################################################################
source "${HOME}"/.bash.d/scripts/functions.sh

# ensure we have a place for our virtualenvs
if [[ ! -d ${HOME}/.virtualenvs ]]; then
    mkdir "$HOME"/.virtualenvs
fi
export WORKON_HOME=$HOME/.virtualenvs

# virtualenv wrapper
if installed virtualenvwrapper.sh; then
    if [[ -f /usr/local/bin/python3 ]]; then
        export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
    else
        export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
    fi
    source /usr/local/bin/virtualenvwrapper.sh
fi

# multitail
if installed multitail; then
    confpath="${HOME}/.multitail.conf"
    alias ptail="multitail --config ${confpath} -CS plogging -ev \"HEAD /favicon.ico\" -ev \"deferred.py\" -j"
fi


################################################################################
# Python exports
################################################################################

if [[ -d $(brew --prefix)/Cellar/python ]]; then
    pathmunge /usr/local/opt/python/libexec/bin
fi

# add in my own libraries
pypathmunge ${HOME}/lib/python after
export PYTHONIOENCODING=utf_8

# locally installed python packages/scripts
if [[ -d $HOME/.local/bin ]]; then
    pathmunge ${HOME}/.local/bin
fi

# pip should only run if there is a virtualenv currently activated
#export PIP_REQUIRE_VIRTUALENV=true

# cache pip-installed packages to avoid re-downloading
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache

if installed pyenv; then
    eval "$(pyenv init -)";

    # we need to make sure this is installed if we have pyenv installed
    installed pyenv-virtualenvwrapper || brew install pyenv-virtualenvwrapper
    if [[ ! -d ~/.pyenv/plugins/pyenv-pip-rehash ]]; then
        git clone https://github.com/yyuu/pyenv-pip-rehash.git ~/.pyenv/plugins/pyenv-pip-rehash
    fi
fi

if installed pyenv-virtualenvwrapper; then
    export PYENV_VIRTUALENV_DISABLE_PROMPT=0;
    export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true";
    pyenv virtualenvwrapper;
fi
