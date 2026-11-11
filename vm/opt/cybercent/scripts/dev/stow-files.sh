#!/bin/bash

# Development only: Symlink VM files from the Git repository
# into the actual filesystem using GNU Stow.
# For production, deploy real files instead of symlinks.

set -e

# -R restow and stow again (restow)
# -d /home/dev/cybercent -> Directory containing the vm package.
# -t / -> Target directory (Linux root).
# vm -> Package to stow.
sudo stow -R -d /home/dev/cybercent/vm -t /opt opt
