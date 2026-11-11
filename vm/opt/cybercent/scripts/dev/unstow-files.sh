#!/bin/bash

# Development only: Remove symlinks created by stow-files.sh
# without deleting the original files in the Git repository.

sudo stow -D -t /opt/ -d /home/dev/cybercent/vm opt
