# https://gitlab.com/dwt1/dotfiles

export EDITOR='nvim'

[[ $- != *i* ]] && return

shopt -s cmdhist
shopt -s histappend
shopt -s checkwinsize

alias vim='nvim'
alias ls='ls -al --color=always'
alias apt-up='sudo apt-get update && sudo apt-get upgrade'
alias apt-ar='sudo apt-get autoremove'
alias rm='rm -i'

echo "$(date)"

eval "$(starship init bash)"
