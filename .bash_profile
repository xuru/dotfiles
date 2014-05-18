
# Set architecture flags
export ARCHFLAGS="-arch x86_64"

# Ensure user-installed binaries take precedence
export PATH=/usr/local/bin:$PATH

# Load .bashrc if it exists
test -f ~/.bashrc && source ~/.bashrc

[ -r "$HOME/.smartcd_config" ] && ( [ -n $BASH_VERSION ] || [ -n $ZSH_VERSION ] ) && source ~/.smartcd_config

if [ -d /usr/local/google-cloud-sdk ]; then
    # The next line updates PATH for the Google Cloud SDK.
    source /usr/local/google-cloud-sdk/path.bash.inc

    # The next line enables bash completion for gcloud.
    source /usr/local/google-cloud-sdk/completion.bash.inc
fi
