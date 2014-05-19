# vim: set ts=4 sw=4 tw=80 syntax=sh :
#
################################################################################
# Linux specific stuff
################################################################################
if test "$OS" = "Linux"; then
    # fix GTK
    export GDK_NATIVE_WINDOWS=1

    #Pango makes firefox hell slow
    export MOZ_DISABLE_PANGO=1
    export FIREFOX_DSP=none

    if check_installed meld; then
        export SVN_MERGE=/usr/bin/meld
        export SVN_DIFF=/usr/bin/meld
    fi

    if [ -e /usr/bin/ack-grep ]; then
        alias ack=ack-grep
    fi
fi