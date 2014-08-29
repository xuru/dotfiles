#  vim: set ts=4 sw=4 tw=80 syntax=sh :
#
################################################################################
# git specific stuff
################################################################################
case "$OS" in
Darwin*)
    if check_installed ksdiff; then
        export GIT_EXTERNAL_DIFF=/usr/local/bin/ksdiff
    elif check_installed opendiff; then
        export GIT_EXTERNAL_DIFF=/usr/bin/opendiff
    fi
    ;;
Linux*)
    if check_installed meld; then
        export GIT_EXTERNAL_DIFF=/usr/bin/meld
    fi
    ;;
esac

alias gst='git status -sb'
alias gb='git branch'
alias gl='git log'
alias gf='git fetch'
alias gfs='git fetch && git status'
alias glo='git log --oneline --decorate'
alias gap='git add --patch'
alias gco='git checkout'
alias gcv='git commit -v'
alias gcm='git commit -m'
alias gca='git commit --amend'
alias gpp='git pull --rebase && git push'
alias gmf='git merge --ff-only'
alias gcp='git cherry-pick'
alias gwp='git whatchanged -p'
alias gch='git cherry -v'
