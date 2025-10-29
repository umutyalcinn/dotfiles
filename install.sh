#!/usr/bin/env bash

DOTFILES=$HOME/dotfiles

ln -sf $DOTFILES/.tmux.conf ~/.tmux.conf
ln -sf $DOTFILES/nvim ~/.config/nvim
