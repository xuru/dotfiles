# Homebrew
#   http://brew.sh/
# Homebrew Cask
#   http://caskroom.io/
# 

# Before we begin:
#
# * Install XCode
# * Install XQuartz: https://xquartz.macosforge.org
# 
# * bash_completion
# * grc
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

if [ ! -d /usr/local ]; then
    sudo mkdir /usr/local
    sudo chown -R $USER:staff /usr/local
fi

if [ ! -x /usr/local/bin/brew ]; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

cd ~

brew update
brew upgrade
brew prune
brew cleanup
brew linkapps

# brew cask
brew tap caskroom/cask
brew install brew-cask

## Lib
brew install libevent
brew install libxml2
brew install libxslt

# completion
brew install bash-completion
brew install homebrew/completions/pip-completion
brew install homebrew/completions/vagrant-completion
brew install homebrew/completions/django-completion
# brew install homebrew/versions/bash-completion2

# python
brew install python

# apps
brew install htop
brew install ack
brew install ctags
brew install cscope
brew install git
brew install git-flow
brew install nmap
brew install openssl
brew install readline
brew install tmux
brew install tofrodos
brew install tree
brew install wget

# special care is taken with macvim...
# brew install macvim
brew unlink python
brew install -v --force macvim --env-std --override-system-vim --python --cscope
brew link macvim
brew link python

################################################################################
# GUI apps
################################################################################

brew cask install alfred
brew cask install adium
brew cask install caffeine
brew cask install dropbox
brew cask install dash
brew cask install firefox
brew cask install flash
brew cask install flash-player
brew cask install flux
brew cask install github
brew cask install google-chrome
brew cask install google-drive
brew cask install google-hangouts
brew cask install gpgtools
brew cask install heroku-toolbelt
brew cask install iterm2
brew cask install java
brew cask install kaleidoscope
brew cask install moom
brew cask install 1password
brew cask install omnidisksweeper
brew cask install onyx
# patterns
brew cask install prezi
brew cask install proximity
# Radia
brew cask install skitch
brew cask install skype
brew cask install sourcetree
brew cask install sublime-text
brew cask install thunderbird
brew cask install virtualbox
brew cask install vagrant
brew cask install vagrant-manager
brew cask install vlc
# vmware-fusion
brew cask install xquartz

brew cask cleanup

# setup a few things with python
export PATH=/usr/local/bin:$PATH

pip install --upgrade pip setuptools
pip install --upgrade virtualenv virtualenvwrapper atomac docopt

# setup fonts
brew tap caskroom/fonts                  # you only have to do this once!
brew update

brew cask install font-inconsolata
brew cask install font-dejavu-sans-mono-for-powerline
brew cask install font-anonymous-pro-for-powerline
brew cask install font-ubuntu-mono-powerline
brew cask install font-source-code-pro-for-powerline
brew cask install font-sauce-code-powerline
brew cask install font-meslo-lg-for-powerline
brew cask install font-liberation-mono-for-powerline
brew cask install font-inconsolata-g-for-powerline
brew cask install font-inconsolata-for-powerline
brew cask install font-inconsolata-dz-for-powerline
brew cask install font-fira-mono-for-powerline
brew cask install font-droid-sans-mono-for-powerline

if [[ ! -d .dotfiles ]]; then
    git clone https://github.com/xuru/dotfiles.git .dotfiles
else
    python ./.dotfiles/engage.py --verbose
    . ./.dotfiles/osx
fi
