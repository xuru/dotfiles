#!/bin/bash
# Symlink some dotfiles, yo!

REPO="git://github.com/xuru/dotfiles.git"
WORK=~/.dotfiles
ORIG=~/tmp/.dotfile_preserve

function symtastico {
  # make symlinks, ignoring directories and archiving existing files.
  destdir=$1
  shift
  for file in $@; do
    name=`basename "$file"`
    if [ -f "$file" ] || test "$name" = ".vim"; then
       dest=$destdir/$name
       echo -n "$name, "
       if [ -h $dest ]; then
         echo -n "re-"
         rm $dest
       elif [ -e $dest ]; then
         echo -n "moving existing file to $ORIG/, "
         mkdir -p "$ORIG"
         mv $dest "$ORIG/"
       fi
       ln -s $file $dest
       echo "symlinked."
    fi
  done
  }


## Clone repo if it doesn't exist.  Otherwise, leave it to user to pull/update.
if [ ! -d "$WORK" ]; then
  mkdir "$WORK"
  git clone "$REPO" $WORK
fi

## .dotfiles
symtastico ~ `ls -ad "$WORK"/\.*`

## ~/bin
mkdir -p ~/bin
chmod 700 ~/bin
if [ -d $WORK/bin ]; then
    symtastico ~/bin `ls -d "$WORK"/bin/*`
fi

## ~/.ssh
# Just dir/permissions.  Don't wanna autolink config...
mkdir -p ~/.ssh
chmod 700 ~/.ssh
if [ -f ~/.authorized_keys ]; then
    chmod -f 600 ~/.authorized_keys
fi
chown -R $USER:`id -g $USER` ~/.ssh

## ~/tmp ~/work stuff
mkdir -p ~/tmp
mkdir -p ~/rep
