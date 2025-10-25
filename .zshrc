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

# Nice sudo prompt
export SUDO_PROMPT="Enter sudo password: "

# Lesspipe & lessfilter
LESSOPEN="|/usr/bin/lesspipe.sh %s"
export LESSOPEN


###################################
#  Source personal configuration  #
###################################

zsh-defer source "$ZDOTDIR"/lscolors.sh
zsh-defer source "$ZDOTDIR"/functions.zsh
zsh-defer source "$ZDOTDIR"/aliases.zsh
zsh-defer source "$ZDOTDIR"/fzf_defaults.sh
zsh-defer source "$ZDOTDIR"/fzf.zsh


#################
#  Keybindings  #
#################

# Better vi mode
source $XDG_DATA_HOME/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
ZVM_VI_EDITOR=nvim

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
