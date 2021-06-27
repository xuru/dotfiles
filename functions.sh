

function prt_error() {
    echo "$(tput setaf 1)$1$(tput sgr0)"
}

function prt_warn() {
    echo "$(tput setaf 5)$1$(tput sgr0)"
}

function prt() {
    echo "$(tput setaf 2)$1$(tput sgr0)"
}

function installed() {
    [[ -n $(type -p "$1") ]]
}

function check_installed() {
    if [[ -z $(type -p "$1") ]] ; then
        prt_warn "$1 is not installed"
    fi
}
