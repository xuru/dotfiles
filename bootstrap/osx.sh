#!/bin/bash

# define helpers
source_dir=~/.dotfiles/bootstrap

# install homebrew
`which -s brew`
if [[ $? != 0 ]]; then
    echo ''
    echo '##### Installing Homebrew...'
    if [ ! -d /usr/local ]; then
        sudo mkdir /usr/local
        sudo chown -R $USER:staff /usr/local
    fi
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo ''
    echo '##### Running Homebrew Updates...'
    brew update
    brew upgrade
    brew prune
    brew cleanup
    brew linkapps
fi

if [[ `brew cask --version` != 0 ]]; then
    brew tap caskroom/cask
    brew install brew-cask
fi

# install helpfull formulas
export formulas='
    libevent
    libxml2
    libxslt
    libtiff
    openjpeg

bash-completion
homebrew/completions/pip-completion
homebrew/completions/vagrant-completion
homebrew/completions/django-completion

    ack
    ag
    cowsay
    ctags
    cscope
    dnsmasq
    freetype
    geoip
    gettext
    git
    git-flow
    hub
    nmap
    openssl
    readline
    ssh-copy-id
    tmux
    tofrodos
    tree
    watch
    webp
    wget
'

for formula in $formulas
do
    tmp=`brew list | grep $formula`
    if [[ ! $tmp ]]; then
        echo ''
        echo '##### Installing Formula '$formula'...'
        brew install $formula

        if [[ $formula = 'dnsmasq' ]]; then
            # setup dnsmask
            mkdir /usr/local/etc/
            cp -rf $source_dir/templates/dnsmasq.conf /usr/local/etc

            # setup dnsmask daemon
            sudo ln -sfv /usr/local/opt/dnsmasq/*.plist /Library/LaunchDaemons
            sudo chown root /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist
            sudo launchctl load /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist

            # setup resolver
            sudo mkdir -p /etc/resolver
            sudo cp -rf $source_dir/templates/dev /etc/resolver
            # empty cache
            dscacheutil -flushcache
            # scutil --dns
        fi

        if [[ $formula = 'nginx' ]]; then
            ln -sfv /usr/local/opt/nginx/*.plist ~/Library/LaunchAgents
            launchctl load ~/Library/LaunchAgents/homebrew.mxcl.nginx.plist
        fi

        if [[ $formula = 'redis' ]]; then
            ln -sfv /usr/local/opt/redis/*.plist ~/Library/LaunchAgents
            launchctl load ~/Library/LaunchAgents/homebrew.mxcl.redis.plist
        fi
        
        if [[ $formula = 'gettext' ]]; then
            ln -s /usr/local/Cellar/gettext/*/bin/msgfmt /usr/local/bin/msgfmt
        fi
    fi
done
