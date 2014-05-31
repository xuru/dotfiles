#!/usr/bin/env python

import os
import stat
from os.path import join, exists, dirname, basename, abspath, realpath, islink
from glob import glob

HERE = dirname(abspath(__file__))
HOME = os.environ['HOME']

# TODO: Add script arguments: verbose, force, etc
VERBOSE = False

skipfiles = [
    '.ropeproject',
    '.git',
]


def backup_file(filename, dry_run=False):
    if not dry_run:
        os.rename(filename, filename + '.orig')


def _get_excluded_files(origin, excludes):
    if excludes:
        excludes = excludes + skipfiles
    else:
        excludes = skipfiles

    exfiles = []
    for exclude in excludes:
        exfiles += glob(join(origin, exclude))
    return set(exfiles)


def symtastico(origin, destination, include, excludes=None, dry_run=False):
    exfiles = _get_excluded_files(origin, excludes)
    files = set(glob(join(origin, include))) - set(exfiles)

    work = {}
    for f in files:
        slink = join(destination, basename(f))

        if exists(slink):
            if islink(slink):
                if f == realpath(slink):
                    if VERBOSE:
                        print "Symbolic link is correct: {} ...skipping".format(slink)
                else:
                    print "[WARN] unlinking {}".format(slink)
                    if not dry_run:
                        os.unlink(slink)
                    work[slink] = f
            else:
                backup_file(slink, dry_run=dry_run)
                print "[WARN] Backed up {} and replacing with symlink...".format(slink)
                work[slink] = f
        else:
            work[slink] = f

    if not work:
        print "No work to do..."

    for slink, orig in work.items():
        if not dry_run:
            os.symlink(orig, slink)
        print "Creating symbolic link {} to {}".format(slink, orig)

# all the dot files first
symtastico(HERE, HOME, '.*', excludes=["*~", ".*~", ".ssh"])

# bin directory...
if not exists(join(HOME, 'bin')):
    os.makedirs(join(HOME, 'bin'))
symtastico(join(HERE, 'bin'), join(HOME, 'bin'), '*', excludes=["*~", ".*~"])

# ssh directory...
sshdir = join(HOME, '.ssh')
if not exists(sshdir):
    os.makedirs(sshdir)

if os.stat(sshdir).st_mode != 16832:
    os.chmod(sshdir, 0700)

symtastico(join(HERE, '.ssh'), sshdir, '*', excludes=["*~", ".*~"])

excludes = [join(sshdir, 'config'), join(sshdir, 'known_hosts')]
keys = set(glob(join(sshdir, '*'))) - set(excludes)
for key in keys:
    if os.stat(key).st_mode != 33152:
        print "Changing permisions on key {}".format(key)
        os.chmod(key, 0600)
