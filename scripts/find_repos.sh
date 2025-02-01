#!/usr/bin/bash

#echo $(fd --type=d --hidden -g .git -E .local -E .cache -E Downloads / | sed 's,/*[^/]\+/*$,,' | fzf | sed "s/^/'/;s/$/'/")
#cd $(fd --type=d --hidden -g .git -E .local -E .cache -E Downloads / | sed 's,/*[^/]\+/*$,,' | fzf | sed "s/^/'/;s/$/'/")
cd $(fd --type=d --hidden -g .git -E .local -E .cache -E Downloads / | sed 's,/*[^/]\+/*$,,' | fzf)
#fd --type=d --hidden -g .git -E .local -E .cache -E Downloads / | sed 's,/*[^/]\+/*$,,' | fzf
#find="$(fd --type=d --hidden -g .git -E .local -E .cache -E Downloads / | sed 's,/*[^/]\+/*$,,' | fzf)"
#
#echo=$find
#cd=$find
