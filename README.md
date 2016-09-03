# Xuru's dotfiles

## Using Git and the bootstrap script

You can clone the repository wherever you want. (I like to keep it in `~/.dotfiles`.) The bootstrap.sh script will pull in the latest version and copy the files to your home folder.

```bash
cd ~ && git clone https://github.com/mathiasbynens/dotfiles.git .dotfiles && cd .dotfiles && source bootstrap.sh
```

To update, `cd` into your local `dotfiles` repository and then:

```bash
source bootstrap.sh
```

Alternatively, to update while avoiding the confirmation prompt:

```bash
set -- -f; source bootstrap.sh
```

## Git-free install

To install these dotfiles without Git:

```bash
cd; curl -#L https://github.com/xuru/dotfiles/tarball/master | tar -xzv --strip-components 1 --exclude={README.md,bootstrap.sh,osx}
```

To update later on, just run that command again.

