# Plugin Manager
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d $ZINIT_HOME ]; then 
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"

export WSM_USE_SESSION_SLICE=true
# Uswm startup
if uwsm check may-start && uwsm select; then
	exec systemd-cat -t uwsm_start uwsm start default
fi

# Add Cargo binary to PATH
PATH=$PATH:~/.cargo/bin

# Man export to Neovim
export MANPAGER="nvim +Man!"

export BROWSER="librewolf"

# Plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

zinit ice depth=1
#zinit light jeffreytse/zsh-vi-mode

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
bindkey -e '^K' history-search-backward
bindkey -e '^J' history-search-forward
bindkey -e -s '^F' '. ~/scripts/find_repos.sh^M clear^M' 

# Alias'
alias v="nvim"
alias vf="fd --type=d --hidden --strip-cwd-prefix --exclude .git && v ."
alias t="tmux"
alias z="zathura"
alias gs="git status"
alias ga="git add"
alias gc="git commit -m"
alias gco="git checkout"
alias gm="git merge"
alias gf="git fetch"
alias gph="git push"
alias gpl="git pull"
alias fetch="fastfetch"
alias hyprconf="v ~/.config/hypr/hyprland.conf"
alias nvimconf="v ~/.config/nvim/init.lua"
alias code="codium"
alias bc="cd ../"
alias bcc="cd ../../"
alias m="man"
alias fm="compgen -c | fzf | xargs man"
alias vfzf="~/scripts/vfzf.sh"
alias vcfg="~/scripts/vfzf.sh ~/.config"
alias vdot="~/scripts/vfzf.sh ~/dotfiles"
alias vdev="~/scripts/vfzf.sh ~/dev"
alias ls="eza --grid --color=always --icons=always"
alias l="eza --long --color=always --icons=always --no-user -a"
alias icat="kitty +kitten icat"
alias unmount="sudo umount /mnt/External"
alias acat="~/scripts/rendercwd.sh"
alias cat="bat"

NO_STRIP=true

# Zoxide Setup
eval "$(zoxide init --cmd cd zsh)"

# Fzf Setup
eval "$(fzf --zsh)"
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git "
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
export FZF_DEFAULT_OPTS="--height 50% --layout=default --border --color=hl:#2dd4bf"

# Fzf previews
export FZF_CTRL_T_OPTS="--preview 'bat --color=always -n --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --icons=always --tree --color=always {} | head -200'"
export FZF_TMUX_OPTS=" -p90%,70% "  

# Oh-my-posh Prompt Setup
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/config.toml)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Created by `pipx` on 2024-11-06 16:03:58
export PATH="$PATH:/home/davidl/.local/bin"
[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh
[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh

export CRYPTOGRAPHY_OPENSSL_NO_LEGACY=1
