#!/usr/bin/env bash
#  vim: set ts=4 sw=4 tw=80 syntax=sh :
#
set +e

########################################
# Setup basic settings
########################################

# Case insensitive string comparison
# shopt -s nocaseglob

ECHO=echo
OS=
ARCH=

find_os
find_architecture

source ${HOME}/.bash.d/scripts/functions.sh
source ${HOME}/.bash.d/scripts/exports.sh
