set -U LC_ALL en_US.UTF-8
set -U LANG en_US.UTF-8

set -U INPUTRC /etc/inputrc
set -U EDITOR vim
set -U VISUAL vim
set -U PAGER less
set -U MANPAGER less

# grep colors
set -U GREP_OPTIONS '--color=auto'
set -U GREP_COLOR '1;32'

# modify my path
set -x PATH $HOME/bin $PATH
set -x PATH /usr/local/bin $PATH
set -x PATH /usr/local/sbin $PATH

# Set architecture flags
set -x ARCHFLAGS "-arch x86_64"

set -Ux CA_CERTS_PATH /usr/share/curl/ca-bundle.crt

################################################################################
# Ack
################################################################################
# per directory settings
set -x ACKRC ".ackrc"

################################################################################
# Python exports
################################################################################
set -x PYTHONPATH $PYTHONPATH:$HOME/lib/python
set -x PYTHONPATH /usr/local/lib/python2.7/site-packages $PYTHONPATH
set -x PYTHONIOENCODING utf_8

if test -d $HOME/.cscope
    set -x CSCOPE_DB $HOME/.cscope/cscope.out
end

if not test -d $HOME/.virtualenvs
    mkdir $HOME/.virtualenvs 
end

# virutal env stuff
set -x PIP_USE_WHEEL "true"
set -x PIP_WHEEL_DIR "$HOME/.pip/wheels"
set -x PIP_FIND_LINKS "$HOME/.pip/wheels"
set -x PIP_DOWNLOAD_CACHE "$HOME/.pip/cache"

set -g VIRTUALFISH_COMPAT_ALIASES
set -gx VIRTUALFISH_ACTIVATION_FILE .venv


################################################################################
# Oh My Fish
################################################################################
# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Theme
set fish_theme agnoster

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-fish/plugins/*)
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
# Example format: set fish_plugins autojump bundler

# Path to your custom folder (default path is $FISH/custom)
#set fish_custom $HOME/dotfiles/oh-my-fish
#
set fish_plugins git brew extract gi vi-mode

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish

. $HOME/.config/fish/virtual.fish
. $HOME/.config/fish/auto_activation.fish
. $HOME/.config/fish/global_requirements.fish
