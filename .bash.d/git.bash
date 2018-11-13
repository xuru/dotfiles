#  vim: set ts=4 sw=4 tw=80 syntax=sh :
#
################################################################################
# git specific stuff
################################################################################
case "$OS" in
Linux*)
    if installed meld; then
        export GIT_EXTERNAL_DIFF=/usr/bin/meld
    fi
    ;;
esac


git.current_branch() {
  br=`git branch | grep "*"`
  echo ${br/* /}
}

git.checkout() {
  git checkout $1
}

git.fetch() {
  git fetch origin
}

git.pull() {
  git pull origin $1
}

git.rebase() {
  git rebase -i origin/$1
}

git.force_push() {
  git push -f origin $1
}

git.push() {
  git push origin $1
}

git.merge() {
  git merge --edit $1
}

git.delete_branch() {
  git branch -D $1 &&
  git push origin :$1
}

freshen() {
    BRANCH=$(git.current_branch)
    git fetch upstream &&
    git status &&
    git checkout staging &&
    git pull upstream staging &&
    git push origin staging
}

    # git checkout $BRANCH &&
    # git rebase staging &&
    # git push -f origin HEAD
# }

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
