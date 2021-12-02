#!/bin/bash

# just in case
sudo apt-get update && apt-get install tmux

BASE_DIR="~/.tmux"
PLUGIN_DIR="$BASE_DIR/plugins"

mkdir -p $PLUGIN_DIR

git clone https://github.com/tmux-plugins/tpm $PLUGIN_DIR/tpm
cp .tmux.conf ~/.tmux.conf

echo "tmux setup complete :)"
