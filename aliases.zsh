##########
#  Sudo  #
##########

alias sudo="sudo "
alias sunv='sudo -E nvim $1'
alias sue='sudo -E $1'

###########################
#  Force colored outputs  #
###########################

alias grep='grep --color=always'
alias fgrep='fgrep --color=always'
alias egrep='egrep --color=always'
alias diff='diff --color=always'
alias ip='ip --color=always'

#####################
#  File operations  #
#####################

alias md="mkdir -p"
alias t='touch'
alias et='rm -rv $TRASH/*'
alias mv='mv -iv'
alias rm='rm -iv'
alias cp='cp -iv'
alias ln='ln -iv'
alias rmf='rm -rfvi'
alias rmv='trash-put'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

alias q='exit'


#########
#  Bat  #
#########

alias bi='bat -pp --color=always'
alias b='bat'


###############
#  Systemctl  #
###############

alias sc='sudo systemctl'
alias scu='systemctl --user'


############
#  Neovim  #
############

alias nvm="$HOME"/scripts/bin/nv-launch
alias big="/usr/bin/nvim -n -u NONE -i NONE -N"


#########
#  Fzf  #
#########

alias rgf="$HOME"/scripts/bin/rg-fzf
alias fv='nvm $(fzf \
    --preview-window=nohidden \
    --border=top \
  --border-label="Pick a file to open in neovim")'


#######################
#  Directory listing  #
#######################

alias lt='eza --color=always -h --git --git-ignore --group-directories-first -T'
alias lta='eza --color=always -h --group-directories-first --git --git-ignore -T -a'
alias l='eza --color=always --group-directories-first -h --git --git-ignore'
alias la='eza --color=always --group-directories-first -h --git -a'
alias ll='eza -l --color=always --group-directories-first -h --git'
alias lla='eza -l --color=always --group-directories-first -h --git -a'
alias tree='erd --color force --hidden -L 3 --no-progress --suppress-size --no-git --no-ignore -x -f -y inverted'


#########
#  Git  #
#########

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


###################
#  Pacman & paru  #
###################

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


##############
#  Assorted  #
##############

alias 1f="onefetch --no-art --no-color-palette --disabled-fields churn authors --true-color never"
alias nvidia-settings='nvidia-settings --config="$XDG_CONFIG_HOME"/nvidia/settings '
alias fdisk="sudo grc fdisk -l"
alias zt='time zsh -i -c exit'
alias ts='tailscale status'
alias ka='killall -q'
alias w='_weather() { curl -s wttr.in/“${1:-bristol}” | head -n 7 ;}; _weather'
alias wget='wget --hsts-file="$XDG_CACHE_HOME/wget/history"'
alias yarn='yarn --use-yarnrc "$XDG_CONFIG_HOME/yarn/config"'
alias txc = 'perl ~/.local/share/texcount/texcount.pl'
