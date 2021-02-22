# Handle dumb terms
[[ $TERM == "dumb" ]] && unsetopt zle && PS1='$ ' && return

echo -n "+++Reading .zshrc"
[[ -o interactive ]] && echo -n " (for interactive use)"
echo .

# Used for reporting how load loading takes
zmodload zsh/datetime
start=$EPOCHREALTIME


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"
POWERLEVEL10K_MODE="nerfont-complete"

zstyle :omz:plugins:ssh-agent identities talentpair github aws-eb

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  poetry
  brew
  thefuck
  git
  direnv
  ssh-agent
  pyenv
  zsh-autosuggestions
  zsh-syntax-highlighting
  vagrant
  docker
  docker-compose
  yarn
  zsh_reload
)

# zsh performance tweaks
# .. use a cache file
zstyle ':completion:*' use-cache on
# .. and then specify the cache file to use (not added to repo: separate file for each machine)
zstyle ':completion:*' cache-path $HOME/.zshcache
# Compilation flags

source "$ZSH"/oh-my-zsh.sh

# User configuration
source $HOME/.zshenv

# aliases
source $HOME/.zshalias

# functions
source $HOME/.zshfunc

# PROMPT COLORS
autoload -U colors
#
HISTFILE=~/.history
HISTIGNORE="ls:ls *:cd:cd -:pwd;exit:date:* --help"
HISTSIZE=5000
SAVEHIST=5000
setopt APPEND_HISTORY # don't overwrite history; append instead
setopt INC_APPEND_HISTORY # append after each command
setopt SHARE_HISTORY # share history between shells
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_SPACE
setopt HIST_NO_STORE
setopt HIST_VERIFY
setopt EXTENDED_HISTORY
setopt HIST_SAVE_NO_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS
setopt MENUCOMPLETE
setopt NOMATCH
unsetopt HIST_EXPIRE_DUPS_FIRST

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# any local overrides
[[ ! -f ~/.zsh_local ]] || source ~/.zsh_local

end=$EPOCHREALTIME

printf "+++Loaded files in %0.4f seconds\n\n" $(($end-$start))
export PATH="/usr/local/opt/qt/bin:$PATH"

export PATH="$HOME/.poetry/bin:$PATH"
