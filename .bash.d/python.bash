#!/usr/bin/env bash
#  vim: set ts=4 sw=4 tw=80 syntax=sh :
#
################################################################################
# python specific stuff
################################################################################
source ${HOME}/.bash.d/functions.sh

# ensure we have a place for our virtualenvs
if [ ! -d $HOME/.virtualenvs ]; then
    mkdir $HOME/.virtualenvs
fi
export WORKON_HOME=$HOME/.virtualenvs

# virtual env wrapper
if installed virtualenvwrapper.sh; then
    export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
    source /usr/local/bin/virtualenvwrapper.sh
fi

# multitail
confpath="~/.multitail.conf"
alias ptail="multitail --config $confpath -CS plogging -ev \"HEAD /favicon.ico\" -ev \"deferred.py\" -j"


################################################################################
# Python exports
################################################################################

if [ -d $(brew --prefix)/Cellar/python ]; then
    pathmunge /usr/local/opt/python/libexec/bin
fi

# add in my own libraries
pypathmunge ${HOME}/lib/python after
export PYTHONIOENCODING=utf_8

# locally installed python packages/scripts
if [ -d $HOME/.local/bin ]; then
    pathmunge ${HOME}/.local/bin
fi


# pip should only run if there is a virtualenv currently activated
#export PIP_REQUIRE_VIRTUALENV=true

# cache pip-installed packages to avoid re-downloading
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache

if installed pyenv; then
    export PYENV_VIRTUALENV_DISABLE_PROMPT=0;
    export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true";
    eval "$(pyenv init -)";
    pyenv virtualenvwrapper_lazy;
fi
