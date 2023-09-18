# :.config/zsh/.zshrc
# vim:set fdm=marker foldenable ft=zsh foldlevel=0:

# INSTANT PROMPT {{{
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# }}}

# GENERAL OPTIONS {{{
bindkey -e
setopt glob_dots
setopt autocd
setopt interactivecomments
setopt magicequalsubst
setopt nonomatch
setopt numericglobsort
# }}}

# SAUCE {{{
autoload -Uz select-word-style
select-word-style bash
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
source "$XDG_CONFIG_HOME"/zsh/p10k.zsh
source "$XDG_DATA_HOME"/antigen/bundles/romkatv/zsh-defer/zsh-defer.plugin.zsh
source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
zsh-defer source "$XDG_DATA_HOME"/antigen/bundles/trystan2k/zsh-tab-title/zsh-tab-title.plugin.zsh
zsh-defer source "$XDG_DATA_HOME"/antigen/bundles/Tarrasch/zsh-bd/bd.plugin.zsh
zsh-defer source "$XDG_DATA_HOME"/antigen/bundles/QuarticCat/zsh-smartcache/zsh-smartcache.plugin.zsh
zsh-defer source "$XDG_DATA_HOME"/usr/share/doc/pkgfile/command-not-found.zsh
zsh-defer source "$XDG_CONFIG_HOME"/zsh/functions.zsh
zsh-defer source "$XDG_CONFIG_HOME"/zsh/aliases.zsh
zsh-defer source "$XDG_CONFIG_HOME"/zsh/fzf.zsh
zsh-defer source "$XDG_CONFIG_HOME"/zsh/completion.zsh
zsh-defer source /etc/grc.zsh
zsh-defer source /usr/share/zsh/plugins/zsh-autopair/autopair.zsh
zsh-defer source /usr/share/fzf/key-bindings.zsh
zsh-defer source /usr/share/zsh/plugins/fzf-tab-git/fzf-tab.zsh
zsh-defer source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
zsh-defer source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# }}}

# HISTORY {{{
HISTFILE="$XDG_DATA_HOME"/zsh/history
HISTSIZE=500000
SAVEHIST=500000
HIST_STAMPS="mm/dd/yyyy"
setopt APPEND_HISTORY
# setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_SPACE
setopt HIST_EXPIRE_DUPS_FIRST
# setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
# }}}

# AUTOSUGGESTION {{{
ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=(
    end-of-line
)
ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS=(
    forward-word
    emacs-forward-word
)
# }}}

# SHELL VARIABLES {{{
# export ZPWR_EXPAND_BLACKLIST=(l lla ll la lt lta z)
ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
ZVM_VI_EDITOR=nvim
export TERM=wezterm
export SUDO_PROMPT="➤ Password: "
export PROMPT_EOL_MARK=""
export EXA_COLORS="da=1;31"
export LS_COLORS="rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:"
# }}}

# ZOXIDE {{{
export _ZO_FZF_OPTS="
    --color fg:#574b42,bg:8,hl:1,fg+:7,bg+:#bdb1a8,hl+:9,gutter:8,scrollbar:#574b42,label:1
    --color border:8,info:#574b42,prompt:1,spinner:2,pointer:1,marker:4,separator:8,header:1
    --color preview-bg:#ded8d3,preview-border:#ded8d3,preview-scrollbar:8,preview-label:1
	--no-sort
    --height 80%
    --border=top
    --border-label='Quick jump to directory'
    --info=inline-right
    --scrollbar='▓'
    --preview-window border-sharp
    --preview-label='PREVIEW'
    --pointer=' ⇒'
    --marker='✓ '
    --prompt=' ➤ '
    --tabstop=4
    --layout=reverse
    --margin=1,5
    --padding=0,0
    --multi
    --bind '?:toggle-preview'
    --bind 'ctrl-space:toggle'
    --bind 'ctrl-j:toggle-out'
    --bind 'ctrl-k:toggle-in'
    --bind 'enter:accept'
    --bind 'alt-i:accept'
    --bind 'alt-a:toggle-all'
    --bind 'tab:down'
    --bind 'shift-tab:up'
    --preview='erd --color force --hidden -L 1 --no-progress --suppress-size --no-git --no-ignore -x -f -y inverted {2..} | head -200' --preview-window border-sharp"
autoload -Uz compinit && compinit -i
eval "$(zoxide init zsh)"
# }}}

# Hishtory Config:
export PATH="$PATH:/home/lckdscl/.hishtory"
