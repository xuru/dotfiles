#  vim: set ts=4 sw=4 tw=80 syntax=sh :
#
################################################################################
# smartcd specific stuff
################################################################################

if test "$OS" = "Darwin"; then
    [ -r "$HOME/.smartcd_config" ] && ( [ -n $BASH_VERSION ] || [ -n $ZSH_VERSION ] ) && source ~/.smartcd_config
fi
