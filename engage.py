#!/usr/bin/env python

"""Engage
Link up all the dot files from the github backed up files.

Usage:
  engage.py [-vd]
  engage.py (-h | --help)
  engage.py --version

Options:
  -h --help     Show this screen.
  --version     Show version.
  -v --verbose  Verbose
  -d --dry-run  Dry run (assumes verbose)

"""

__version__ = '1.0.0'
__author__ = 'Eric Plaster'

from docopt import docopt

import os
from os.path import join, exists, dirname, basename, abspath, realpath, islink, isdir
from glob import glob

HERE = dirname(abspath(__file__))
HOME = os.environ['HOME']

# TODO: Add script arguments: verbose, force, etc
VERBOSE = False


class Linker(object):
    skipfiles = ['.ropeproject', '.git']

    def __init__(self, options):
        self.opts = options
        self.verbose = options['--verbose']
        self.dry_run = options['--dry-run']

    def _backup_file(self, filename):
        """ Backup files to <filename>.orig in order to recover if it was a mistake
        """
        if not self.dry_run:
            if self.verbose:
                print "Backing up file {}".format(filename)
            os.rename(filename, filename + '.orig')

    def _get_excluded_files(self, origin, excludes):
        """ Remove excluded files from origin directory set of files and return them
        """
        if excludes:
            excludes = excludes + self.skipfiles
        else:
            excludes = self.skipfiles

        exfiles = []
        for exclude in excludes:
            exfiles += glob(join(origin, exclude))
        return set(exfiles)

    def _relink(self, slink, orig):
        """ Remove the old link (or backup if it's a file) and link to correct file.
        """
        if islink(slink):
            if orig != realpath(slink):
                if self.verbose:
                    print "[WARN] relinking {}".format(slink)

                if not self.opts['dry_run']:
                    os.unlink(slink)
                    os.symlink(orig, slink)
            else:
                if self.verbose:
                    print "Symbolic link is correct: {} ...skipping".format(slink)
        else:
            if exists(slink):
                self._backup_file(slink)
            if not self.dry_run:
                os.symlink(orig, slink)

    def symtastico(self, origin, destination, include, excludes=None):
        """ Given an origin directory and a destination directory, link files from destination to origin
        """
        exfiles = self._get_excluded_files(origin, excludes)
        files = set(glob(join(origin, include))) - set(exfiles)

        for f in files:
            slink = join(destination, basename(f))

            if not isdir(slink):
                self._relink(slink, f)


def _ssh_dir(linker):
    """ Link up files in the .ssh directory
    """
    sshdir = join(HOME, '.ssh')
    if not exists(sshdir):
        os.makedirs(sshdir)

    if os.stat(sshdir).st_mode != 16832:
        os.chmod(sshdir, 0700)

    linker.symtastico(
        join(HERE, '.ssh'), sshdir, '*', excludes=["*~", ".*~"])

    excludes = [join(sshdir, 'config'), join(sshdir, 'known_hosts')]
    keys = set(glob(join(sshdir, '*'))) - set(excludes)
    for key in keys:
        if os.stat(key).st_mode != 33152:
            print "Changing permisions on key {}".format(key)
            os.chmod(key, 0600)


def main(options):
    """ Main function to rule them all
    """
    linker = Linker(options)

    #--------------------------------------------------------------------------------
    # all the dot files first
    #--------------------------------------------------------------------------------
    linker.symtastico(
        HERE, HOME, '.*', excludes=["*~", ".*~", ".ssh"])

    #--------------------------------------------------------------------------------
    # bin directory...
    #--------------------------------------------------------------------------------
    if not exists(join(HOME, 'bin')):
        os.makedirs(join(HOME, 'bin'))

    linker.symtastico(
        join(HERE, 'bin'), join(HOME, 'bin'), '*', excludes=["*~", ".*~"])

    #--------------------------------------------------------------------------------
    # ssh directory
    #--------------------------------------------------------------------------------
    _ssh_dir(linker)

if __name__ == '__main__':
    options = docopt(__doc__, version=__version__)

    if options['--dry-run']:
        options['--verbose'] = True

    main(options)
