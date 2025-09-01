#!/usr/bin/bash

cd $(fd --type=d --hidden -g .git | sed 's,/*[^/]\+/*$,,' | fzf)
