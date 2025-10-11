######################
#  Default keybinds  #
######################

# Remove zsh native autocompletion popup
bindkey -r ^D

# Swap forward word and forward char
bindkey ^F forward-word
bindkey '^[f' forward-char

# Swap backward word and backward char
bindkey ^B backward-word
bindkey '^[b' backward-char

###################
#  Toggling sudo  #
###################

# Ctrl-X to toggle sudo in normal mode
# [Esc] [Esc] to toggle sudo in vimode
sudo-command-line() {
	[[ -z $BUFFER ]] && zle up-history
	if [[ $BUFFER == sudo\ * ]]; then
		LBUFFER="${LBUFFER#sudo }"
	elif [[ $BUFFER == $EDITOR\ * ]]; then
		LBUFFER="${LBUFFER#$EDITOR }"
		LBUFFER="sudoedit $LBUFFER"
	elif [[ $BUFFER == sudoedit\ * ]]; then
		LBUFFER="${LBUFFER#sudoedit }"
		LBUFFER="$EDITOR $LBUFFER"
	else
		LBUFFER="sudo $LBUFFER"
	fi
}
zle -N sudo-command-line
bindkey "^X" sudo-command-line
bindkey -M vicmd '\e\e' sudo-command-line

##############################
#  Moving process fg <-> bg  #
##############################

# Ctrl-Z to put process in background
# Ctrl-Z again to put it in foreground
fancy-ctrl-z() {
	if [[ $#BUFFER -eq 0 ]]; then
		BUFFER="fg"
		zle accept-line
	else
		zle flush-input
		zle clear-screen
	fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

##############################
#  Accepting autosuggestion  #
##############################

# accept with EOL (Ctrl-E)
export ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=(end-of-line)

# partial accept with forward word
export ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS=(
	forward-word
	emacs-forward-word
	vi-forward-word
	vi-forward-word-end
	vi-forward-blank-word
	vi-forward-blank-word-end
	vi-find-next-char
	vi-find-next-char-skip
)

################################
#  Run previous command again  #
################################

run-again() {
	zle up-history
	zle accept-line
}
zle -N run-again
bindkey "^K" run-again
