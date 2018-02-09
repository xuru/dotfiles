#  vim: set ts=4 sw=4 tw=80 syntax=sh :
#
################################################################################
# python specific stuff
################################################################################
if [ ! -d $HOME/.virtualenvs ]; then
    mkdir $HOME/.virtualenvs
fi
export WORKON_HOME=$HOME/.virtualenvs

export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3

if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    . /usr/local/bin/virtualenvwrapper.sh
fi

if [ -f /usr/local/bin/activate.sh ]; then
    . /usr/local/bin/activate.sh
fi

# if [[ $OS == winnt ]] ; then
    # # if we're on windows using cygwin (you are aren't you?)
    # # we need to use the installed version for pywin32
    # export VIRTUALENVWRAPPER_PYTHON=/cygdrive/c/Python27/python.exe

    # export PATH=/cygdrive/c/Python27:/cygdrive/c/Python27/Scripts:$PATH
# fi

# -ev negates the regular expression so it will not show up in the logfile window only
# for the file following the command(s).
# -cS uses the color scheme set in multitail.conf for only the file follwing the command.
# -i specific file to tail.
# -wh window 2's only 12 lines high

# The order of these lines matter as each color scheme and regular expression are tied to
# the file that is being tailed. Everything before each -i is tied to the options before it.

confpath="~/.multitail.conf"
alias ptail="multitail --config $confpath -CS plogging -ev \"HEAD /favicon.ico\" -ev \"deferred.py\" -j"
# how do we install or upgrade a global package? We can temporarily turn off this restriction by
# i.e.  syspip install --upgrade pip setuptools virtualenv
#syspip(){
##   PIP_REQUIRE_VIRTUALENV="" pip "$@"
#}

################################################################################
# Python exports
################################################################################
# add in my own libraries
export PYTHONPATH=$PYTHONPATH:${HOME}/lib/python
export PYTHONIOENCODING=utf_8
# locally installed python packages/scripts
export PATH=${HOME}/.local/bin:${PATH}

# pip should only run if there is a virtualenv currently activated
#export PIP_REQUIRE_VIRTUALENV=true
# cache pip-installed packages to avoid re-downloading
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache

export PYENV_VIRTUALENV_DISABLE_PROMPT=0

# pip bash completion start
_pip_completion()
{
    COMPREPLY=( $( COMP_WORDS="${COMP_WORDS[*]}" \
                   COMP_CWORD=$COMP_CWORD \
                   PIP_AUTO_COMPLETE=1 $1 ) )
}
complete -o default -F _pip_completion pip
# pip bash completion end

# pipenv & pew bash completion start
source $(pew shell_config)
 #eval $(env _PIPENV_COMPLETE=source-bash pipenv)
_pipenv_completion() {
    local IFS=$'\t'
    COMPREPLY=( $( env COMP_WORDS="${COMP_WORDS[*]}" \
                   COMP_CWORD=$COMP_CWORD \
                   _PIPENV_COMPLETE=complete-bash $1 ) )
    return 0
}

complete -F _pipenv_completion -o default pipenv
# pipenv & pew bash completion end
