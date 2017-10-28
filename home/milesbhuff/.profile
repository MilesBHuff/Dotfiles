#!/usr/bin/env sh
## See /usr/share/doc/bash/examples/startup-files for examples.
## You'll probably need the bash-doc package to get these example files.

## The system-wide default umask is set in /etc/profile.
## ssh umasks are configured via the libpam-umask package.
umask 022

## Start gpg-agent
eval "$(gpg-agent --daemon)"
