#  vim: set ts=4 sw=4 tw=80 syntax=sh :
#
################################################################################
# cscope specific stuff
################################################################################
if check_installed cscope; then
    CSCOPE_DB=${HOME}/.cscope/cscope.out; export CSCOPE_DB   
fi
