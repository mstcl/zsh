#################
#  P10K prompt  #
#################

# This makes the prompt appear instantly
(( ${+commands[direnv]} )) && emulate zsh -c "$(direnv export zsh)"
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
(( ${+commands[direnv]} )) && emulate zsh -c "$(direnv hook zsh)"


source $XDG_DATA_HOME/zsh/plugins/powerlevel10k/powerlevel10k.zsh-theme
source $XDG_CONFIG_HOME/zsh/p10k.zsh

##########################################################
#  High-priority configs                                 #
#  NOTE: These get loaded first but might be overridden  #
##########################################################

# Emacs keybinding in viins
bindkey -e

# Cache and lazy-load other files
source $XDG_DATA_HOME/zsh/plugins/zsh-defer/zsh-defer.plugin.zsh
zsh-defer source $XDG_DATA_HOME/zsh/plugins/zsh-smartcache/zsh-smartcache.plugin.zsh


#####################
#  Other utilities  #
#####################

# Colorize commands like `ping`, `lsblk`, etc.
zsh-defer source /etc/grc.zsh

# Alias helper
zsh-defer source $XDG_DATA_HOME/zsh/plugins/zsh-you-should-use/you-should-use.plugin.zsh

# Show what to install if command is not found
zsh-defer source /usr/share/doc/pkgfile/command-not-found.zsh

# Add pair parentheses automatically
zsh-defer source $XDG_DATA_HOME/zsh/plugins/zsh-autopair/autopair.zsh

# Show suggested commands from command history
zsh-defer source $XDG_DATA_HOME/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

zsh-defer source $XDG_DATA_HOME/zsh/plugins/zsh-window-title/zsh-window-title.zsh

# Use syntax highlighting to colorize the shell
zsh-defer source $XDG_DATA_HOME/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


######################
#  SYNTAX HIGHLIGHT  #
######################

typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_HIGHLIGHTERS+=(main brackets)
ZSH_HIGHLIGHT_STYLES[comment]='fg=8,bold'
ZSH_HIGHLIGHT_STYLES[alias]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red,underline'
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=blue'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=blue,bold'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=blue,bold'
ZSH_HIGHLIGHT_STYLES[arithmetic-expansion]='fg=white,bold'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument-unclosed]='fg=yellow,underline'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument-unclosed]='fg=yellow,underline'
ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[global-alias]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[path]='fg=white,bold'
ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=blue,underline'
ZSH_HIGHLIGHT_STYLES[assign]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[named-fd]='fg=yellow,bold'
ZSH_HIGHLIGHT_STYLES[numeric-fd]='fg=yellow'


######################
#  Assorted configs  #
######################

# cd without typing cd
setopt autocd

# Allow comments in commands
setopt interactive_comments

# Unquoted arguments of form `anything=expression` have filename expansion
setopt magicequalsubst


######################
#  Globbing configs  #
######################

# dotfiles will be matched without specifying the dot
# *config will match .config
setopt glob_dots

# Sort filenames numerically when applicable
setopt numericglobsort

# Does not return error if file not found when globbing
setopt nonomatch


#############################
#  Command history configs  #
#############################

HISTFILE=$XDG_DATA_HOME/zsh/history
HISTSIZE=500000
SAVEHIST=500000
HIST_STAMPS="mm/dd/yyyy"
setopt APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_SPACE
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_ALL_DUPS


####################################
#  Exported environment variables  #
####################################

# Set this to whatever terminal one is using,
# it seems to affect some GPU-based rendering

# Nice sudo prompt
export SUDO_PROMPT="Enter sudo password: "

# Lesspipe & lessfilter
LESSOPEN="|/usr/bin/lesspipe.sh %s"
export LESSOPEN

export LS_COLORS="di=01;34:ln=01;36:pi=40;33:so=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01; 35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36"

export EZA_COLORS="rs=0:mh=00:do=01;35:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:${LS_COLORS}"

##################################
#  Personal aliases & functions  #
##################################

zsh-defer source "$ZDOTDIR"/functions.zsh
zsh-defer source "$ZDOTDIR"/aliases.zsh
zsh-defer source "$ZDOTDIR"/fzf.zsh


#################
#  Keybindings  #
#################

# Better vi mode
source $XDG_DATA_HOME/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
ZVM_VI_EDITOR=nvim
ZVM_VI_INSERT_ESCAPE_BINDKEY=jk # Use 'jk' to go from insert -> normal

# User keybindings
zsh-defer source "$ZDOTDIR"/keybindings.zsh

# Tab complete
zsh-defer source $XDG_DATA_HOME/zsh/plugins/fzf-tab/fzf-tab.zsh


##########################
#  Low priority configs  #
##########################

# Load autocompletion
autoload -Uz compinit && compinit -i
eval "$(zoxide init zsh)"

# Use bash select-word-style so Ctrl-W deletes
# a directory at a time, not the whole directory
autoload -Uz select-word-style
select-word-style bash

# Load direnv
eval "$(direnv hook zsh)"
