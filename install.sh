#!/usr/bin/env bash

set -euo pipefail

TMUX_CONF_TARGET=~/.tmux.conf
TMUX_CONF_BACKUP="$TMUX_CONF_TARGET.bak"
GITCONFIG_TARGET=~/.gitconfig
GITCONFIG_BACKUP="$GITCONFIG_TARGET.bak"

if [ -f ${TMUX_CONF_TARGET} ] ; then
    mv ${TMUX_CONF_TARGET} ${TMUX_CONF_BACKUP}
fi

if [ -f ${GITCONFIG_TARGET} ] ; then
    mv ${GITCONFIG_TARGET} ${GITCONFIG_BACKUP}
fi

cd "$(dirname "$0")"

if [ ! -L ${GITCONFIG_TARGET} ] ; then
    ln -s $(realpath gitconfig) $GITCONFIG_TARGET
fi

if [ ! -L ${TMUX_CONF_TARGET} ] ; then
    ln -s $(realpath gitconfig) $TMUX_CONF_TARGET
fi
