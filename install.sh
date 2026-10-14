#!/usr/bin/env bash

DOTFILES=$HOME/dotfiles

ln -sf "$DOTFILES/.tmux.conf" "$HOME/.tmux.conf"
ln -sf "$DOTFILES/nvim" "$HOME/.config/nvim"
ln -sf "$DOTFILES/doom" "$HOME/.config/doom"
ln -sf "$DOTFILES/emacs" "$HOME/.config/emacs"
ln -sf "$DOTFILES/sketchybar" "$HOME/.config/sketchybar"
