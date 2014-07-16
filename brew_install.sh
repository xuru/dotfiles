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

if [ ! -d /usr/local ]; then
    sudo mkdir /usr/local
fi
sudo chown -R $USER:staff /usr/local

if [ ! -x /usr/local/bin/brew ]; then
    ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
fi

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
brew install glib
brew install nmap
brew install openssl
brew install readline
brew install tmux
brew install tofrodos
brew install tree
brew install wget

# special care is taken with macvim...
brew install macvim
brew unlink python
brew unlink macvim
brew remove macvim
brew install -v --force macvim
brew link macvim
brew link python

brew install wine
brew install wintricks

# install fonts
winetricks fonts allfonts

cd /tmp
git clone https://github.com/Lokaltog/powerline-fonts.git

for font in powerline-fonts/**/*.tff; do
    cp -v ${font} ~/Library/Fonts/
done;
for font in powerline-fonts/**/*.otf; do
    cp -v ${font} ~/Library/Fonts/
done;

################################################################################
# GUI apps
################################################################################

brew cask install alfred
brew cask install adium
brew cask install angry-ip-scanner
brew cask install caffeine
brew cask install dropbox
brew cask install cord
brew cask install dash
# degrees
brew cask install firefox
brew cask install flash
brew cask install flash-player
brew cask install flux
brew cask install gfxcardstatus
brew cask install github
brew cask install gimp
brew cask install google-chrome
brew cask install google-drive
brew cask install google-hangouts
brew cask install gpgtools
brew cask install heroku-toolbelt
brew cask install hipchat
brew cask install iterm2
brew cask install java
brew cask install jenkins-menu
brew cask install kaleidoscope
brew cask install ksdiff
brew cask install moom
brew cask install mysqlworkbench
brew cask install onepassword
brew cask install omnidisksweeper
brew cask install onyx
brew cask install pacifist
# patterns
brew cask install prezi
brew cask install proximity
brew cask install pycharm
# Radia
brew cask install skitch
brew cask install skype
brew cask install sourcetree
brew cask install sublime-text
brew cask install thunderbird
brew cask install tinkertool
brew cask install vagrant
brew cask install vagrant-manager
brew cask install virtualbox
brew cask install vlc
# vmware-fusion
brew cask install wiztoolsorg-restclient
brew cask install xquartz

brew cask cleanup
