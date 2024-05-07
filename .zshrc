# Powerlevel10k Theme
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Plugins
source ~/.config/zsh/powerlevel10k/powerlevel10k.zsh-theme
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

ENABLE_CORRECTION="true"

# Binds
bindkey "^H" backward-delete-word
bindkey "^C" \E

# Exports for Pfetch
export PF_INFO="ascii title os host kernel de editor cpu pkgs uptime memory"
export EDITOR="nvim"

# Alias'
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
alias - -="cd -"
alias l="ls -la"
alias cdf="cd && fzf"

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
NO_STRIP=true

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Zoxide Setup
eval "$(zoxide init --cmd cd zsh)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
