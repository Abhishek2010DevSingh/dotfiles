# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set the theme for Oh My Zsh.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use random themes.
# ZSH_THEME="random"

# Set list of themes to pick from when ZSH_THEME=random is set.
# ZSH_THEME_RANDOM_CANDIDATES=("robbyrussell" "agnoster")

# Uncomment to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment to use hyphen-insensitive completion.
# HYPHEN_INSENSITIVE="true"

# Auto-update Oh My Zsh settings.
zstyle ':omz:update' mode auto        # Automatically update
zstyle ':omz:update' frequency 7     # Update every 7 days

# Uncomment to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment to show dots while waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment to disable VCS untracked files check for large repos.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# History settings
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
setopt sharehistory

# Plugins
plugins=(git zsh-autosuggestions zsh-syntax-highlighting fzf-tab)

# Source Oh My Zsh.
source $ZSH/oh-my-zsh.sh

# Set the default editor.
export EDITOR='nvim'

# User-specific environment variables and aliases.
export LANG=en_US.UTF-8

# Custom aliases
alias ls="lsd"
alias cat="bat"
alias gs="git status"
alias gp="git pull"
alias gl="git log --oneline --graph"
alias ..="cd .."
alias ...="cd ../.."

# Starship prompt initialization.
eval "$(starship init zsh)"

# FZF initialization
eval "$(fzf --zsh)"

# Zoxide initialization
eval "$(zoxide init --cmd cd zsh)"

# Rust environment
. "$HOME/.cargo/env"

# Performance improvement: Lazy-load less frequently used plugins.
autoload -Uz add-zsh-hook

# Debugging logs for troubleshooting.
export ZSH_DEBUG_LOG=/tmp/zsh-debug.log


### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

export PATH=$HOME/.local/bin:$PATH

# bun completions
[ -s "/home/abhishek2010/.bun/_bun" ] && source "/home/abhishek2010/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
