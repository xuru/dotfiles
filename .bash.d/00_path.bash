#!/usr/bin/env bash
#  vim: set ts=4 sw=4 tw=80 syntax=sh :
#
################################################################################
# XXXXXX specific stuff
################################################################################
pathmunge "$HOME/bin"

### Added by the Heroku Toolbelt
if [[ -d /usr/local/heroku ]]; then
  pathmunge "/usr/local/heroku/bin" after
fi
