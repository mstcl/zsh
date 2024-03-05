alias 1f="onefetch --no-art --no-color-palette --disabled-fields churn authors --true-color never"
alias nvidia-settings='nvidia-settings --config="$XDG_CONFIG_HOME"/nvidia/settings '
alias zt='time zsh -i -c exit'
alias ts='tailscale status'
alias ka='killall -q'
alias w='_weather() { curl -s wttr.in/“${1:-bristol}” | head -n 7 ;}; _weather'
alias wget='wget --hsts-file="$XDG_CACHE_HOME/wget/history"'
alias yarn='yarn --use-yarnrc "$XDG_CONFIG_HOME/yarn/config"'
alias txc='perl ~/.local/share/texcount/texcount.pl'
