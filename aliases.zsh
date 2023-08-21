# :.config/zsh/.aliases
# vim:set fdm=marker foldenable ft=zsh foldlevel=0:

# Sudo {{{
alias sudo="sudo "
alias sunv='sudo -E nvim $1'
alias sue='sudo -E $1'
# }}}
# Auto color {{{
alias grep='grep --color=always'
alias fgrep='fgrep --color=always'
alias egrep='egrep --color=always'
alias diff='diff --color=always'
alias ip='ip --color=always'
# }}}
# Filesystem management {{{
alias md="mkdir -p"
alias t='touch'
alias et='rm -rv $TRASH/*'
alias mv='mv -iv'
alias rm='rm -iv'
alias cp='cp -iv'
alias ln='ln -iv'
alias rmf='rm -rfvi'
alias rmv='trash-put'
alias q='exit'
# }}}
# System tools {{{
alias 1f="onefetch --no-art --no-color-palette --disabled-fields churn authors --true-color never"
alias fdisk="sudo grc fdisk -l"
alias zt='time zsh -i -c exit'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'
alias ts='tailscale status'
alias ka='killall -q'
alias b='bat -pp'
alias sc='sudo systemctl'
alias scu='systemctl --user'
alias nvidia-settings='nvidia-settings --config="$XDG_CONFIG_HOME"/nvidia/settings '
# }}}
# Neovim {{{
alias big="/usr/bin/nvim -n -u NONE -i NONE -N"
alias fv='nvm $(fzf --height 40% \
    --preview-window=nohidden \
    --height=70% \
    --margin=5%,7% --layout=reverse \
    --marker="++" \
    --preview="bat --line-range :500 {}")'
# }}}
# Media and productivity {{{
alias w='_weather() { curl -s wttr.in/“${1:-bristol}” | head -n 7 ;}; _weather'
# }}}
# XDG standards for non-conformists {{{
alias wget='wget --hsts-file="$XDG_CACHE_HOME/wget/history"'
alias yarn='yarn --use-yarnrc "$XDG_CONFIG_HOME/yarn/config"'
# }}}
# List with exa {{{
alias lt='exa --color=always -h --git --git-ignore --group-directories-first -T'
alias lta='exa --color=always -h --group-directories-first --git --git-ignore -T -a'
alias l='exa --color=always --group-directories-first -h --git --git-ignore'
alias la='exa --color=always --group-directories-first -h --git -a'
alias ll='exa -l --color=always --group-directories-first -h --git'
alias lla='exa -l --color=always --group-directories-first -h --git -a'
# }}}
# Git {{{
alias lz='lazygit'
alias g='git'
alias gs='git status'
alias gss='git status -s'
alias gr='git remote -v'
alias gd='git diff'
alias gi='git init'
alias gp='git push'
alias ga='git add'
alias gall='git add .'
alias gf='git fetch'
alias gra='git remote add origin'
alias gl='git log'
alias gaa='git add --all'
alias gpl='git pull'
alias gpr='git pull --rebase'
alias gpu='git push -u origin master'
alias gc='git clone'
alias gb='git branch'
alias gco='git checkout'
alias gcount='git shortlog -sn'
alias gcp='git cherry-pick'
# }}}
# Paru and pacman {{{
alias u='paru -Syu --removemake'
alias usu='paru -Syu --noconfirm --removemake'
alias pstats='paru -Ps'
alias pcmt='paru -Gc'
alias pnews='paru -Pw'
alias pid='paru -U'
alias pir='paru -S'
alias pnd='paru -Qi'
alias pnr='paru -Si'
alias pfd='paru -Ss'
alias pfr='paru -Qs'
alias pls='paru -Q'
alias plse='paru -Qe'
alias orf='paru -Qdt'
alias pcc='paru -Scd'
alias pli="grep -i installed /var/log/pacman.log | cut -d ' ' -f1,4"
alias plr="grep -i removed /var/log/pacman.log | cut -d ' ' -f1,4"
alias plu="grep -i upgraded /var/log/pacman.log | cut -d ' ' -f1,4"
# }}}
