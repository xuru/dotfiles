#!/usr/bin/env bash

################################################################################
# bootstrap
#   (adapted from https://github.com/joshukraine/mac-bootstrap/blob/master/bootstrap)
#
# This script is intended to set up a new Mac computer with my dotfiles and
# other development preferences.
#               Prerequisites
# Make sure your software is up to date:
#     sudo softwareupdate -i -a --restart
#
# Install Apple's command line tools:
#     xcode-select --install
#
# Reboot, check for additional updates, then reinstall and reboot as needed.
################################################################################


function gprint {
    printf "\033[32m$1\033[39m\n"
}

# Thank you, thoughtbot!
bootstrap_echo() {
  local fmt="$1"; shift

  # shellcheck disable=SC2059
  gprint "\n[BOOTSTRAP] $fmt"
}


# Before we begin double check we have commandline tools installed
if ! check_installed xcodebuild; then
    xcode-select --install
fi

################################################################################
# Variable declarations
################################################################################

osname=$(uname)
export COMMANDLINE_TOOLS="/Library/Developer/CommandLineTools"
export OLD_DOTFILES_BACKUP=$HOME/old_dotfiles_backup
export DICTIONARY_DIR=$HOME/Library/Spelling

export DOTFILES_REPO_URL="https://github.com/xuru/dotfiles.git"
export DOTFILES_BRANCH="master"
export DOTFILES_DIR=$HOME/.dotfiles

################################################################################
# Make sure we're on a Mac before continuing
################################################################################

if [[ "$osname" != "Darwin" ]]; then
    bootstrap_echo "Oops, it looks like you're using a non-UNIX system. This script
only supports Mac. Exiting..."
    exit 1
fi


################################################################################
# Check for presence of command line tools if macOS
################################################################################
if [[ ! -d "$COMMANDLINE_TOOLS" ]]; then
    xcode-select --install
fi


################################################################################
# Authenticate
################################################################################
sudo -v

# Keep-alive: update existing `sudo` time stamp until bootstrap has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

################################################################################
# Clone dotfiles
################################################################################
bootstrap_echo "Cloning dotfiles..."

if [[ -d ${DOTFILES_DIR} ]]; then
  bootstrap_echo "Backing up old dotfiles to $HOME/old_dotfiles_backup..."
  rm -rf "$OLD_DOTFILES_BACKUP"
  cp -R "$DOTFILES_DIR" "$OLD_DOTFILES_BACKUP"
  rm -rf "$DOTFILES_DIR"
fi
git clone "$DOTFILES_REPO_URL" -b "$DOTFILES_BRANCH" "$DOTFILES_DIR"
bootstrap_echo "Done!"

source ${DOTFILES_DIR}/.bash.d/scripts/functions.sh

################################################################################
# Setup dotfiles
################################################################################
bootstrap_echo "Setting up dotfiles..."
source "$DOTFILES_DIR"/install.sh

# python "$DOTFILES_DIR"/engage.py --verbose

bootstrap_echo "Done!"

################################################################################
# Install apps with homebrew
################################################################################
bootstrap_echo "Installing applications..."

sh "$DOTFILES_DIR"/brew_install.sh 2>&1 | tee ~/brew_install.log

bootstrap_echo "Done!"

################################################################################
# Install Vundle & Vim plugins (https://github.com/VundleVim/Vundle.vim.git)
################################################################################
bootstrap_echo "Installing Vundle and vim plugins..."

if [[ -d "$HOME"/.vim/bundle ]]; then
    rm -rf "$HOME"/.vim/bundle
fi
git clone https://github.com/VundleVim/Vundle.vim.git "$HOME"/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

bootstrap_echo "Done!"

################################################################################
# Set macOS preferences
################################################################################
bootstrap_echo "Setting macOS preferences..."

source "$DOTFILES_DIR"/install/macos-defaults.sh

bootstrap_echo "Done!"

echo
echo "**********************************************************************"
echo "**********************************************************************"
echo "****                                                              ****"
echo "**** Mac Bootstrap script complete! Please restart your computer. ****"
echo "****                                                              ****"
echo "**********************************************************************"
echo "**********************************************************************"
echo
