# https://gitlab.com/dwt1/dotfiles

export EDITOR='nvim'
export PATH="/var/lib/flatpak/exports/bin/:$PATH"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

[[ $- != *i* ]] && return

shopt -s cmdhist
shopt -s histappend
shopt -s checkwinsize

alias vim='nvim'
alias ls='ls -al --color=always'
alias apt-up='sudo apt-get update && sudo apt-get upgrade'
alias apt-ar='sudo apt-get autoremove'
alias rm='rm -i'
alias icat='kitty +kitten icat'

echo "$(date)"

eval "$(starship init bash)"
