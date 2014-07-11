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

ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

# brew cask
brew tap caskroom/cask
brew install brew-cask

## Lib
brew install libevent
brew install libxml2
brew install libxslt

brew install bash-completion
brew install homebrew/completions/pip-completion
brew install homebrew/completions/vagrant-completion
brew install homebrew/completions/django-completion
brew install homebrew/versions/bash-completion2











