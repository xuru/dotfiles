############################################################
# See: https://github.com/mathiasbynens/dotfiles
############################################################

# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
    shopt -s "$option" 2> /dev/null;
done;

# convox
test -e "${HOME}/.convox/completion.bash" && source ~/.convox/completion.bash
export CONVOX_WAIT=true

export BASHDIR="$HOME/.bash.d"
for file in $BASHDIR/*.bash; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done
unset file;


if [ -f ~/.bash_local ]; then
    [ -r ~/.bash_local ] && source ~/.bash_local;
fi

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
