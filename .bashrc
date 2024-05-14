#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Prompt
PS0='>\n'
PS1='\u@\h \w\n> '

alias grep='grep --color=auto'
alias v="nvim"
alias hyprconf="v ~/.config/hypr/hyprland.conf"
alias nvimconf="v ~/.config/nvim/init.lua"
alias zshconf="v ~/.zshrc"
alias kittyconf="v ~/.config/kitty/kitty.conf"
alias barconf="cd ~/.config/waybar"
alias roficonf="cd ~/.config/rofi"
alias hs="cd ~/.config/hypr/scripts && ls"
alias rs="cd ~/.config/rofi/scripts && ls"
alias bc="cd ../"
alias hc="cd ~"
alias m="man"
alias rsdir="cd ~/dev/rust"
alias pydir="cd ~/dev/python"
alias godir="cd ~/dev/go"
alias javadir="cd ~/dev/java"
alias ls="lsd"
alias l="lsd -la"
alias fd="cd && fzf"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
