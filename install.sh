#!/usr/bin/env bash

SCRIPTDIR="$( cd "$(dirname "$0")" || exit 1 ; pwd -P )"
echo "$SCRIPTDIR"
#set -x

for i in .vim_go_runtime .zshrc .vimrc .tmux.conf .fzf.zsh; do 
    if [ -e "$HOME/$i" ]; then
        if [ ! -f "$HOME/$i-backup" ]; then
            echo "Backup of previous $i"
            mv "$HOME/$i" "$HOME/$i-backup"
        fi
        echo "Linking $SCRIPTDIR/$i to $HOME"
        ln -sf "$SCRIPTDIR/$i" "$HOME/$i"
    else 
        echo "$i not found in $HOME, are you sure you have it installed?"
        echo "Linking $SCRIPTDIR/$i to $HOME"
        ln -sf "$SCRIPTDIR/$i" "$HOME/$i"
    fi
done

sudo cp "$SCRIPTDIR/dev-tmux" /usr/local/bin/
