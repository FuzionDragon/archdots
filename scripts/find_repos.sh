#!/usr/bin/bash

cd $(fd --type=d --hidden -g .git ~/dev | sed 's,/*[^/]\+/*$,,' | fzf)
