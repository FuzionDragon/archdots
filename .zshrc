# Plugin Manager
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d $ZINIT_HOME ]; then 
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"

# Add Cargo binary to PATH
PATH=$PATH:~/.cargo/bin

# Plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Completions
autoload -U compinit && compinit
zinit cdreplay -q
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups

# Binds
bindkey '^K' history-search-backward
bindkey '^J' history-search-forward
bindkey 'TAB' autosuggest-accept

# Exports for Pfetch
export PF_INFO="ascii title os host kernel de editor cpu pkgs uptime memory"
export EDITOR="nvim"

# Alias'
alias v="nvim"
alias fetch="fastfetch"
alias hyprconf="v ~/.config/hypr/hyprland.conf"
alias nvimconf="v ~/.config/nvim/init.lua"
alias code="codium"
alias zshconf="v ~/.zshrc"
alias kittyconf="v ~/.config/kitty/kitty.conf"
alias barconf="cd ~/.config/waybar"
alias roficonf="cd ~/.config/rofi"
alias hs="cd ~/.config/hypr/scripts && ls"
alias rs="cd ~/.config/rofi/scripts && ls"
alias bc="cd ../"
alias bbc="cd ../../"
alias hc="cd ~"
alias m="man"
alias rsdir="cd ~/dev/rust"
alias pydir="cd ~/dev/python"
alias godir="cd ~/dev/go"
alias javadir="cd ~/dev/java"
alias - -="cd -"
alias ls="lsd"
alias l="lsd -la"
alias icat="kitty +kitten icat"

NO_STRIP=true

# Zoxide Setup
eval "$(zoxide init --cmd cd zsh)"

# Fzf Setup
eval "$(fzf --zsh)"

# Oh-my-posh Prompt Setup
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/config.toml)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Created by `pipx` on 2024-11-06 16:03:58
export PATH="$PATH:/home/davidl/.local/bin"
