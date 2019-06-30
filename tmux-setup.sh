#!/bin/bash

# just in case
sudo apt-get update && apt-get install tmux

BASE_DIR="$HOME/.tmux"
PLUGIN_DIR="$BASE_DIR/plugins"

mkdir -p $PLUGIN_DIR

git clone https://github.com/tmux-plugins/tpm $PLUGIN_DIR/tpm
wget https://raw.github.com/disasterbyte/dotfiles/master/.tmux.conf -O $HOME/.tmux.conf

echo "tmux setup complete :)"
