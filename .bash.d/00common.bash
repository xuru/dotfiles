# vim: set ts=4 sw=4 tw=80 syntax=sh
set +e

# Case insensitive string comparison
shopt -s nocaseglob

# gather some info to switch on
export HOSTNAME=`uname -n`

ECHO=echo
OS=
ARCH=

check_ret() {
    RET=$?
    if [[ $RET -ne 0 ]] ; then
        $ECHO $1 failed
        exit 2
    fi
}


find_os() {
    uname_s=`uname -s`
    check_ret uname
    case $uname_s in
        CYGWIN_NT-5.2-WOW64) OS=winnt;;
        *CYGWIN_NT*) OS=winnt;;
        *CYGWIN*) OS=winnt;;
        *darwin*) OS=macosx;;
        *Darwin*) OS=macosx;;
        *linux*) OS=linux;;
        *Linux*) OS=linux;;
        *NetBSD*) OS=netbsd;;
        *FreeBSD*) OS=freebsd;;
        *OpenBSD*) OS=openbsd;;
        *DragonFly*) OS=dragonflybsd;;
    esac
}


find_architecture() {
    uname_m=`uname -m`
    check_ret uname
    case $uname_m in
        i386) ARCH=x86;;
        i686) ARCH=x86;;
        amd64) ARCH=x86;;
        ppc64) ARCH=ppc;;
        *86) ARCH=x86;;
        *86_64) ARCH=x86;;
        "Power Macintosh") ARCH=ppc;;
    esac
}

find_os
find_architecture

function check_installed() {
    if ! [[ -n `type -p $1` ]] ; then
        prt_warn "$1 is not installed"
        return 0;
    fi
    return 1;
}



set_downloader() {
    test_program_installed wget curl
    if [[ $? -ne 0 ]] ; then
        DOWNLOADER=wget
    else
        DOWNLOADER="curl -O"
    fi
}

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
