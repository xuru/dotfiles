#!/usr/bin/env bash
# Homebrew
#   http://brew.sh/
# Homebrew Cask
#   http://caskroom.io/
#
export DOTFILES_DIR="${HOME}/.dotfiles"
source "${DOTFILES_DIR}/functions.sh"
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

trap 'ret=$?; test $ret -ne 0 && printf "failed\n\n" >&2; exit $ret' EXIT

set -e

HOMEBREW_PREFIX="/usr/local"

if [[ -d "$HOMEBREW_PREFIX" ]]; then
  if ! [[ -r "$HOMEBREW_PREFIX" ]]; then
    sudo chown -R "$LOGNAME:admin" /usr/local
  fi
else
  sudo mkdir "$HOMEBREW_PREFIX"
  sudo chflags norestricted "$HOMEBREW_PREFIX"
  sudo chown -R "$LOGNAME:admin" "$HOMEBREW_PREFIX"
fi

if ! installed brew; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

    export PATH="/usr/local/bin:$PATH"
fi

if brew list | grep -Fq brew-cask; then
  laptop_echo "Uninstalling old Homebrew-Cask ..."
  brew uninstall --force brew-cask
fi

brew update --force
brew upgrade
brew bundle --file "$DOTFILES_DIR/Brewfile"

# allow shell integration
curl -L https://iterm2.com/misc/install_shell_integration.sh | bash

brew cleanup
