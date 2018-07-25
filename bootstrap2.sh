#!/usr/bin/env bash

################################################################################
# bootstrap
#
# This script is intended to set up a new Mac computer with my dotfiles and
# other development preferences.
################################################################################


# Thank you, thoughtbot!
bootstrap_echo() {
  local fmt="$1"; shift

  # shellcheck disable=SC2059
  printf "\n[BOOTSTRAP] $fmt\n" "$@"
}


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

if [ "$osname" == "Linux" ]; then
  bootstrap_echo "Oops, looks like you're on a Linux machine. Please have a look at
  my Linux Bootstrap script: https://github.com/joshukraine/linux-bootstrap"
  exit 1
elif [ "$osname" != "Darwin" ]; then
  bootstrap_echo "Oops, it looks like you're using a non-UNIX system. This script
only supports Mac. Exiting..."
  exit 1
fi


################################################################################
# Check for presence of command line tools if macOS
################################################################################

if [ ! -d "$COMMANDLINE_TOOLS" ]; then
  bootstrap_echo "Apple's command line developer tools must be installed before
running this script. To install them, just run 'xcode-select --install' from
the terminal and then follow the prompts. Once the command line tools have been
installed, you can try running this script again."
  exit 1
fi


################################################################################
# Clone repo
################################################################################

bootstrap_echo "Cloning mac-bootstrap repo..."
git clone "$DOTFILES_REPO_URL" -b "$DOTFILES_BRANCH" "$DOTFILES_DIR"


################################################################################
# Authenticate
################################################################################

sudo -v

# Keep-alive: update existing `sudo` time stamp until bootstrap has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


################################################################################
# Set machine name
################################################################################

printf "\\nPlease enter a name for your Mac and press [ENTER] (e.g. Joshua's iMac)\\n"
read -r -p "> " COMPUTER_NAME
export COMPUTER_NAME

printf "\\nPlease enter a host name for your Mac and press [ENTER] (e.g.  joshuas-imac)\\n"
read -r -p "> " HOST_NAME
export HOST_NAME

printf "\\nPlease enter your desired time zone and press [ENTER] (e.g.
Europe/Kiev)\\n(To view available options run \`sudo systemsetup -listtimezones\`)\\n"
read -r -p "> " TIME_ZONE
export TIME_ZONE


################################################################################
# 1. Provision with my adaptation of Laptop (install/laptop)
################################################################################

bootstrap_echo "Step 1: Installing Laptop script..."

sh "$DOTFILES_DIR"/brew_install.sh 2>&1 | tee ~/brew_install.log

bootstrap_echo "Done!"


################################################################################
# 2. Install Oh-My-Zsh (http://ohmyz.sh/)
################################################################################

# bootstrap_echo "Step 2: Installing Oh-My-Zsh..."

# if [ -d "$HOME"/.oh-my-zsh ]; then
#   rm -rf "$HOME"/.oh-my-zsh
# fi

# git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

# bootstrap_echo "Done!"


################################################################################
# 3. Setup dotfiles (http://jsua.co/dotfiles)
################################################################################

bootstrap_echo "Step 3: Installing dotfiles..."

# if [[ -d $DOTFILES_DIR ]]; then
#   bootstrap_echo "Backing up old dotfiles to $HOME/old_dotfiles_backup..."
#   rm -rf "$OLD_DOTFILES_BACKUP"
#   cp -R "$DOTFILES_DIR" "$OLD_DOTFILES_BACKUP"
#   rm -rf "$DOTFILES_DIR"
# fi

# bootstrap_echo "Cloning dotfiles repo to ${DOTFILES_DIR} ..."

# git clone "$DOTFILES_REPO_URL" -b "$DOTFILES_BRANCH" "$DOTFILES_DIR"

# shellcheck source=/dev/null
python "$DOTFILES_DIR"/engage.py --verbose

bootstrap_echo "Done!"


################################################################################
# 4. Install ~/bin utilities
################################################################################

# bootstrap_echo "Step 4: Installing ~/bin utilities..."

# cp -R "$DOTFILES_DIR"/bin/* "$HOME"/bin/

# bootstrap_echo "Done!"


################################################################################
# 5. Set up Tmuxinator (https://github.com/tmuxinator/tmuxinator)
################################################################################

# bootstrap_echo "Step 5: Setting up Tmuxinator..."

# if [ ! -d "$HOME"/.tmuxinator/ ]; then
#   mkdir "$HOME"/.tmuxinator
# fi

# cp "$DOTFILES_DIR"/lib/default.yml "$HOME"/.tmuxinator/

# bootstrap_echo "Done!"


################################################################################
# 6. Install Ukrainian language utilities
#
# Reference:
# * http://apple.stackexchange.com/a/11842/75491
# * http://extensions.services.openoffice.org/en/project/ukrainian-dictionary
################################################################################

# bootstrap_echo "Step 6: Installing Ukrainian language utilities..."

# cp "$DOTFILES_DIR"/lib/{hyph_uk.dic,uk_UA.aff,uk_UA.dic} "$DICTIONARY_DIR"

# bootstrap_echo "Done!"


################################################################################
# 7. Install Fira Code font
################################################################################

bootstrap_echo "Step 7: Installing Fira Code fixed-width font..."
if [ -d "$HOME"/src/fonts ]; then
  rm -rf "$HOME"/src/fonts
fi
git clone https://github.com/tonsky/FiraCode "$HOME"/src/fira-code
cp "$HOME"/src/fira-code/distr/ttf/* "$HOME"/Library/Fonts/
rm -rf "$HOME"/src/fira-code

bootstrap_echo "Done!"


################################################################################
# 8. Install Vundle & Vim plugins (https://github.com/VundleVim/Vundle.vim.git)
################################################################################

bootstrap_echo "Step 8: Installing Vundle and vim plugins..."
if [ -d "$HOME"/.vim/bundle ]; then
  rm -rf "$HOME"/.vim/bundle
fi
git clone https://github.com/VundleVim/Vundle.vim.git "$HOME"/.vim/bundle/Vundle.vim
# cp -R "$DOTFILES_DIR"/vim/colors "$HOME"/.vim # So Vim won't complain about solarized not being found.
vim +PluginInstall +qall
# rm -rf "$HOME"/.vim/colors

bootstrap_echo "Done!"


################################################################################
# 9. Set macOS preferences
################################################################################

bootstrap_echo "Step 9: Setting macOS preferences..."

# shellcheck source=/dev/null
source "$DOTFILES_DIR"/osx

# shellcheck source=/dev/null
# source "$DOTFILES_DIR"/install/macos-dock

bootstrap_echo "Done!"

echo
echo "**********************************************************************"
echo "**********************************************************************"
echo "****                                                              ****"
echo "**** Mac Bootstrap script complete! Please restart your computer. ****"
echo "****                                                              ****"
echo "****                     http://jsua.co/macos                     ****"
echo "****                                                              ****"
echo "**********************************************************************"
echo "**********************************************************************"
echo
