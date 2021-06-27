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
    echo "Oops, it looks like you're using a non-UNIX system. This script
only supports Mac. Exiting..."
    exit 1
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

if [[ ! -d "${DOTFILES_DIR}" ]]; then
    git clone "$DOTFILES_REPO_URL" -b "$DOTFILES_BRANCH" "$DOTFILES_DIR"
fi

source "${DOTFILES_DIR}"/functions.sh

################################################################################
# Check for presence of command line tools if macOS
################################################################################
if [[ ! -d "$COMMANDLINE_TOOLS" ]]; then
    xcode-select --install
fi

################################################################################
# Install apps with homebrew
################################################################################
prt "Installing applications..."

source "$DOTFILES_DIR"/install/homebrew.sh

prt "Done!"

################################################################################
# Setup dotfiles
################################################################################
prt "restoring settings"

cd "$HOME" && mackup restore

prt "Done!"

################################################################################
# Install Vundle & Vim plugins (https://github.com/VundleVim/Vundle.vim.git)
################################################################################
prt "Installing Vundle and vim plugins..."

vim +PlugInstall +qall

prt "Done!"

################################################################################
# Set macOS preferences
################################################################################
prt "Setting macOS preferences..."

source "$DOTFILES_DIR"/install/macos-defaults.sh
source "$DOTFILES_DIR"/install/macos-dock.sh

prt "Done!"

echo
echo "**********************************************************************"
echo "**********************************************************************"
echo "****                                                              ****"
echo "**** Mac Bootstrap script complete! Please restart your computer. ****"
echo "****                                                              ****"
echo "**********************************************************************"
echo "**********************************************************************"
echo
