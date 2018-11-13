#!/usr/bin/env bash
# Homebrew
#   http://brew.sh/
# Homebrew Cask
#   http://caskroom.io/
#

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

function prt_error() {
    echo "$(tput setaf 1)$1$(tput sgr0)"
}

function prt_warn() {
    echo "$(tput setaf 5)$1$(tput sgr0)"
}

function prt() {
    echo "$(tput setaf 2)$1$(tput sgr0)"
}

function check_installed() {
    if ! [[ -n `type -p $1` ]] ; then
        prt_warn "$1 is not installed"
        return 0;
    fi
    return 1;
}


# Before we begin:
#
# * Install XCode
if ! check_installed xcodebuild; then
    prt_error "XCode is not installed."
    xcode-select --install
fi


if [ ! -d /usr/local ]; then
    sudo mkdir /usr/local
    sudo chmod 775 /usr/local
fi

if [ ! -x /usr/local/bin/brew ]; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update
brew upgrade

# brew cask
brew tap caskroom/cask
brew tap caskroom/fonts


pkgs=(
    ack autoconf bash-completion cmake cscope ctags direnv duti gdbm gettext git git-flow grc htop
    libevent libidn2 libunistring nmap openssl pcre2 pkg-config postgresql@9.5 pyenv
    python readline sqlite tmux tofrodos tree wget xz
)


for pkg in "${pkgs[@]}"
do
    echo "Installing $pkg"
    brew install ${pkg}
done

################################################################################
# GUI apps
################################################################################
cask_apps=(
    1password
    alfred
    appcleaner
    bartender
    caffeine
    dash
    disk-inventory-x
    dropbox
    firefox
    flux
    font-dejavu-sans-mono-for-powerline
    font-droid-sans-mono-for-powerline
    font-fira-mono-for-powerline
    font-hack-nerd-font
    font-inconsolata
    font-inconsolata-dz-for-powerline
    font-inconsolata-for-powerline
    font-inconsolata-g-for-powerline
    font-liberation-mono-for-powerline
    google-chrome
    google-hangouts
    gpg-suite
    iterm2
    java
    macvim
    malwarebytes
    moom
    omnidisksweeper
    onyx
    osxfuse
    postman
    rocket
    skitch
    slack
    sourcetree
    spotify
    textual
    the-unarchiver
    trailer
    tunnelblick
    vagrant
    vanilla
    veracrypt
    virtualbox
    virtualbox-extension-pack
    vlc
    xquartz
    yujitach-menumeters
)

for app in "${cask_apps[@]}"
do
    echo "Installing $app"
done


# allow shell integration
curl -L https://iterm2.com/misc/install_shell_integration.sh | bash

# patterns
# prezi
# proximity

brew prune
brew cleanup

# setup fonts
brew update

brew cask install font-hack-nerd-font
brew cask install font-inconsolata
brew cask install font-dejavu-sans-mono-for-powerline
brew cask install font-anonymous-pro-for-powerline
brew cask install font-ubuntu-mono-powerline
brew cask install font-sauce-code-powerline
brew cask install font-meslo-lg-for-powerline
brew cask install font-liberation-mono-for-powerline
brew cask install font-inconsolata-g-for-powerline
brew cask install font-inconsolata-for-powerline
brew cask install font-inconsolata-dz-for-powerline
brew cask install font-fira-mono-for-powerline
brew cask install font-droid-sans-mono-for-powerline

# if [[ ! -d .dotfiles ]]; then
#     git clone https://github.com/xuru/dotfiles.git .dotfiles
# else
#     python ./.dotfiles/engage.py --verbose
#     . ./.dotfiles/osx
# fi
python ./engage.py --verbose
. ./osx

# install the rest of the bundles.
vim +PlugInstall +qall
