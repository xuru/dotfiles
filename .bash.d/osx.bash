#  vim: set ts=4 sw=4 tw=80 syntax=sh :
#
################################################################################
# OSX specific stuff
################################################################################
if test "$OS" = "Darwin"; then
    # pick a browser
    if [ -x /Applications/Firefox.app/Contents/MacOS/firefox-bin ]; then
        export BROWSER="/Applications/Firefox.app/Contents/MacOS/firefox-bin &>/dev/null"
    elif [ -x /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome ]; then
        export BROWSER="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome &>/dev/null"
    fi

    if [ -d /usr/local/adt/sdk ]; then
        export ANDROID_HOME="/usr/local/adt/sdk"

        # Setup Android development...
        export PATH="$ANDROID_HOME/tools":$PATH
        export PATH="$ANDROID_HOME/build-tools/17.0.0/":$PATH
        export PATH="$ANDROID_HOME/platform-tools":$PATH
        export PATH="$ANDROID_HOME/tools/lib":$PATH
        alias adt=$ANDROID_HOME/../eclipse/Eclipse.app/Contents/MacOS/eclipse
    fi

    # node
    if [ -d /usr/local/share/npm ]; then
        export PATH="/usr/local/share/npm/bin:$PATH"
    fi

    if [ "$TERM_PROGRAM" = "Apple_Terminal" -a "$TERM" = "vt100" ];then
        export TERM="screen"
    fi

    if [ -x /usr/libexec/java_home ]; then
        if /usr/libexec/java_home &> /dev/null
        then export JAVA_HOME=`/usr/libexec/java_home`
        else prt_warn "Java is not installed."
        fi
    fi

    # latest wins...
    if [ -d /Applications/MacVim.app ]; then
        alias vi=/Applications/MacVim.app/Contents/MacOS/Vim
        alias vim=/Applications/MacVim.app/Contents/MacOS/Vim
    fi

    if [ -d /usr/local/Cellar/macvim ]; then
        alias vi=`brew --prefix macvim`/MacVim.app/Contents/MacOS/Vim
        alias vim=`brew --prefix macvim`/MacVim.app/Contents/MacOS/Vim
    fi

    if type -p mvim &>/dev/null; then
        alias gvim=mvim
    fi

    ################################################################################
    # Colorizer
    # brew install grc
    ################################################################################
    if check_installed grc; then
        source_if_exists "`brew --prefix`/etc/grc.bashrc"
    fi

    # check if other apps that we use a lot are installed (as a reminder when we
    # log in)
    check_installed ctags
    check_installed curl
    check_installed tree
    check_installed wget
    check_installed tree
fi