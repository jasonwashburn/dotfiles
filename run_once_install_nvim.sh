#!/bin/bash

wget "https://github.com/neovim/neovim/releases/download/v0.8.0/nvim-linux64.deb" -O /tmp/nvim.deb
sudo dpkg --install /tmp/nvim.deb 
