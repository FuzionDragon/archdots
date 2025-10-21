#!/usr/bin/bash
# Opens Neovim into a given file using Fzf and Find
# This script uses an argument which holds the directory to Find into

cd $(fd --type=d --hidden -g .git ~/dev | sed 's,/*[^/]\+/*$,,' | fzf)
nvim .
#nvim $(fd $1 --type=d --hidden --strip-cwd-prefix --exclude .git)
