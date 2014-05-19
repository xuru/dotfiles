# vim: set ts=4 sw=4 tw=80 syntax=sh

# to see all the colors:
# for (( i = 0; i < 17; i++ )); do echo "$(tput setaf $i)This is ($i) $(tput sgr0)"; done
#
function check_installed() {
    if type -p "$1" $>/dev/null; then
        return 0
    else
        prt_warn "$1 is not installed"
    fi
    return 1
}

# gather some info to switch on
export HOSTNAME=`uname -n`
export OS=`uname -s`

function prt_error() {
    echo "$(tput setaf 1)$1$(tput sgr0)"
}

function prt_warn() {
    echo "$(tput setaf 5)$1$(tput sgr0)"
}

function prt() {
    echo "$(tput setaf 2)$1$(tput sgr0)"
}

function source_if_exists() {
    if test -e "$1"; then
        . "$1"
    else
        prt_warn "Couldn't source $1"
    fi
}
