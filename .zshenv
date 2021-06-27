source "$HOME/.zshfunc"

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LC_ALL='en_US.UTF-8';

# Change this to your console based IRC client of choice.
export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli
export TODO="tasks"

# EDITORS ----------------------------------------------------------------------
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
  export GIT_EDITOR='vim'
else
  export EDITOR='mvim'
  export GIT_EDITOR='vim'
fi

# support colors in less
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# NODE ----------------------------------------------------------------------
# Enable persistent REPL history for `node`.
export NODE_REPL_HISTORY=~/.node_history;

# Allow 32³ entries; the default is 1000.
export NODE_REPL_HISTORY_SIZE='32768';

# Use sloppy mode by default, matching web browsers.
export NODE_REPL_MODE='sloppy';

# VOLTA and node
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
export PATH="/usr/local/opt/postgresql@9.5/bin:$PATH"


# PYTHON ----------------------------------------------------------------------
# Make Python use UTF-8 encoding for output to stdin, stdout, and stderr.
export PYTHONIOENCODING='UTF-8';
export WORKON_HOME="${HOME}/.virtualenvs"

export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="$PATH:$(brew --prefix pyenv)"
eval "$(pyenv init -)"

# use pyenv to create virtualenvs by default
export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"
pyenv virtualenvwrapper


export ACKRC=".ackrc"

if [[ "$OS" == "macosx" ]]; then
  if hash brew &> /dev/null; then
    export HOMEBREW_CASK_OPTS="--appdir=/Applications"
  fi
fi

pathmunge "$HOME/bin"
