# vim: set ts=4 sw=4 tw=80 syntax=sh :
#
################################################################################
# completion specific stuff
################################################################################
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

if [ -f /usr/local/bin/grunt ]; then
    eval "$(grunt --completion=bash)"
fi
