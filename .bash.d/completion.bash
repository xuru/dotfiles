# vim: set ts=4 sw=4 tw=80 syntax=sh :
#
################################################################################
# completion specific stuff
################################################################################
if [ -e /etc/bash_completion ]; then
    . /etc/bash_completion
fi

if [ -f /usr/local/bin/grunt ]; then
    eval "$(grunt --completion=bash)"
fi
