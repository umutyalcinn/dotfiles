#!/usr/bin/env bash

DOTFILES=$HOME/dotfiles

ln -sf "$DOTFILES/.tmux.conf" "$HOME/.tmux.conf"
ln -sf "$DOTFILES/nvim" "$HOME/.config/nvim"
ln -sf "$DOTFILES/doom" "$HOME/.config/doom"
