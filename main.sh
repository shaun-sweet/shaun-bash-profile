#!/bin/bash
# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000
BASH_FUNCTIONS=~/bash-settings/functions.sh
PATH_CHANGES=~/bash-settings/path_changes.sh
PS1_CLI=~/bash-settings/ps1.sh
BASH_ALIASES=~/bash-settings/bash_aliases.sh

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac



# append to the history file, don't overwrite it
shopt -s histappend



# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi


# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

if [ -f "$PS1_CLI" ]; then
. "$PS1_CLI"
fi


# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f "$BASH_ALIASES" ]; then
    . "$BASH_ALIASES"
fi

# include path-changes file if it exists
if [ -f "$PATH_CHANGES" ]; then
. "$PATH_CHANGES"
fi

# include functions file if it exists
if [ -f "$BASH_FUNCTIONS" ]; then
. "$BASH_FUNCTIONS"
fi

