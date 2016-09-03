#  vim: set ts=4 sw=4 tw=80 syntax=sh :
#
################################################################################
# python specific stuff
################################################################################
if [ ! -d $HOME/.virtualenvs ]; then
    mkdir $HOME/.virtualenvs 
fi
export WORKON_HOME=$HOME/.virtualenvs

if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    . /usr/local/bin/virtualenvwrapper.sh
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

# pip should only run if there is a virtualenv currently activated
#export PIP_REQUIRE_VIRTUALENV=true
# cache pip-installed packages to avoid re-downloading
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache

