#  vim: set ts=4 sw=4 tw=80 syntax=sh :
#
################################################################################
# python specific stuff
################################################################################
if [ ! -d $HOME/.virtualenvs ]; then
    mkdir $HOME/.virtualenvs 
fi
export WORKON_HOME=$HOME/.virtualenvs

if check_installed virtualenvwrapper.sh; then
    source /usr/local/bin/virtualenvwrapper.sh
fi

# how do we install or upgrade a global package? We can temporarily turn off this restriction by
# i.e.  syspip install --upgrade pip setuptools virtualenv
syspip(){
   PIP_REQUIRE_VIRTUALENV="" pip "$@"
}

################################################################################
# Python exports
################################################################################
# add in my own libraries
export PYTHONPATH=$PYTHONPATH:${HOME}/lib/python
export PYTHONIOENCODING=utf_8

# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=true
# cache pip-installed packages to avoid re-downloading
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache

