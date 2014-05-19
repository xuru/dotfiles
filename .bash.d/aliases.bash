#  vim: set ts=4 sw=4 tw=80 syntax=sh :

## Standard aliases - convenience
# Color syntax
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
fi

if [ "$OS" == "Darwin" ]; then
    alias ls='ls -G'
else
    alias ls='ls --color=auto'
    alias dir='ls --color=auto --format=vertical'
    alias vdir='ls --color=auto --format=long'
fi

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# diff program...
if [ "$OS" == "Darwin" ]; then
    alias meld=opendiff
fi

# some more ls aliases
alias ll='ls -hl'
alias la='ls -a'
alias l='ls -CF'
alias pg="pg -n -p 'page %d:'"

if type -p vim >/dev/null; then
    alias vi=vim
else
    alias vim=vi
fi

if [ -e `which less` ]; then
	alias more='less'
fi

alias dos2unix='fromdos'
alias unix2dos='todos'

################################################################################
# find...
################################################################################
# Keep in mind that there is also "locate test.c" which is faster.
alias ff='find . -iname $*'
alias findbig='find . -type f -size +10000 -exec ls -al {} \;'
# Find all C, C++, C sharp, python, ruby and perl files
alias finds='find . -type f \( -iname "*.c" -o -iname "*.cpp" -o -iname "*.cc" -o -iname "*.h" -o -iname "*.cs" -o -iname "*.py" -o -iname "*.rb" -o -iname "*.pm" -o -iname "*.pl" -o -iname "*.java" \) -print'
alias egreps='finds | xargs -d"\n" egrep'
alias pygrep='find . -type f -iname "*.py" -print | xargs -d"\n" egrep'
alias fgvim='find . -iname \!* | xargs gvim'
alias pygvim='find . -iname \*.py | xargs gvim'


################################################################################
## Standard aliases - for typos
# These are the most common typos made by users, even experienced ones.
################################################################################
alias maek='make'
alias alais='alias'
alias csl='clear'
alias sl='ls --color'
alias givm='gvim'
alias df='/bin/df -h'
alias cp='/bin/cp -v'

################################################################################
# Development
################################################################################
# Find all C, C++, C sharp, python, ruby and perl files
alias delobj='find . -type f \( -iname "*.o" -o -iname "*.obj" -o -iname "*.pyo" -o -iname "*.pyc" -o -iname "*[~]" \) -exec rm -vf {} \;'
alias cleanxml='tidy -xml -indent -m \!*; dos2unix \!*'
alias ant='/usr/bin/ant -logger org.apache.tools.ant.listener.AnsiColorLogger -quiet'
alias updatectags='cd ~; cd $*; ctags -R tags'

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

# Enhanced WHOIS lookups
alias whois="whois -h whois-servers.net"

# Flush Directory Service cache
alias flush="dscacheutil -flushcache"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en0' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en0 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Canonical hex dump; some systems have this symlinked
type -t hd > /dev/null || alias hd="hexdump -C"

# OS X has no `md5sum`, so use `md5` as a fallback
type -t md5sum > /dev/null || alias md5sum="md5"

# Trim new lines and copy to clipboard
alias c="tr -d '\n' | pbcopy"

# Recursively delete `.DS_Store` files
alias cleanup="find . -name '*.DS_Store' -type f -ls -delete"

# Empty the Trash on all mounted volumes and the main HDD
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; rm -rfv ~/.Trash"

# Stuff I never really use but cannot delete either because of http://xkcd.com/530/
alias stfu="osascript -e 'set volume output muted true'"
alias pumpitup="osascript -e 'set volume 10'"
alias hax="growlnotify -a 'Activity Monitor' 'System error' -m 'WTF R U DOIN'"

