#!/usr/bin/bash
# Opens Neovim into a given file using Fzf and Find
# This script uses an argument which holds the directory to Find into

nvim $(find $1 | fzf)
