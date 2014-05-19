#  vim: set ts=4 sw=4 tw=80 syntax=sh :
#
################################################################################
# homebrew specific stuff
################################################################################
if test "$OS" = "Darwin"; then
    if check_installed brew; then
        # NOTE: exporting this will add all packages to any virtualenv
        export PYTHONPATH=$(brew --prefix)/lib/python2.7/site-packages:$PYTHONPATH

        # Setup homebrew auto-completion on the Mac
        source_if_exists `brew --prefix`/etc/bash_completion

        # add completion
        if [ -f $(brew --prefix)/etc/bash_completion ]; then
            . $(brew --prefix)/etc/bash_completion
        fi
    fi
fi
