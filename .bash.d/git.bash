#  vim: set ts=4 sw=4 tw=80 syntax=sh :
#
################################################################################
# git specific stuff
################################################################################
case "$OS" in
Darwin*)
    if check_installed ksdiff; then
        export GIT_EXTERNAL_DIFF=/usr/local/bin/ksdiff
    elif check_installed opendiff; then
        export GIT_EXTERNAL_DIFF=/usr/bin/opendiff
    fi
    ;;
Linux*)
    if check_installed meld; then
        export GIT_EXTERNAL_DIFF=/usr/bin/meld
    fi
    ;;
esac


