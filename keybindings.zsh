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
fancy-ctrl-z () {
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


###############################
#  Instant history accepting  #
###############################

# Ctrl-R to open history prompt and execute selected line
fzf-history-widget() {
  local selected num
  setopt localoptions noglobsubst noposixbuiltins pipefail no_aliases 2> /dev/null
  selected=( $(fc -rnl 1 | awk '{ cmd=$0; sub(/^[ \t]*[0-9]+\**[ \t]+/, "", cmd); if (!seen[cmd]++) print $0 }' |
    FZF_DEFAULT_OPTS="${FZF_DEFAULT_OPTS-} -n2..,.. --scheme=history --bind=ctrl-r:toggle-sort,ctrl-z:ignore ${FZF_CTRL_R_OPTS-} --query=${(qqq)LBUFFER} +m" "fzf") )
  local ret=$?
  if [ -n "$selected" ]; then
    num=$(awk '{print $1}' <<< "$selected")
    if [[ "$num" =~ ^[1-9][0-9]*$ ]]; then
      zle vi-fetch-history -n $num
    else
      LBUFFER="$selected"
    fi
  fi
  zle reset-prompt
  return $ret
}
zle -N fzf-history-widget
fzf-history-widget-accept() {
    fzf-history-widget
    zle accept-line
}
zle -N fzf-history-widget-accept
bindkey '^R' fzf-history-widget-accept
bindkey -M emacs '^R' fzf-history-widget-accept
bindkey -M vicmd '^R' fzf-history-widget-accept
bindkey -M viins '^R' fzf-history-widget-accept


##############
#  Open fzf  #
##############

# Ctrl-T to open standard FZF prompt
__fsel() {
  local cmd="${FZF_CTRL_T_COMMAND}"
  setopt localoptions pipefail no_aliases 2> /dev/null
  local item
  eval "$cmd" | FZF_DEFAULT_OPTS="--bind=ctrl-z:ignore ${FZF_DEFAULT_OPTS-} ${FZF_CTRL_T_OPTS-}" "fzf" -m "$@" | while read item; do
    echo -n "${(q)item} "
  done
  local ret=$?
  echo
  return $ret
}

fzf-file-widget() {
  LBUFFER="${LBUFFER}$(__fsel)"
  local ret=$?
  zle reset-prompt
  return $ret
}
zle     -N            fzf-file-widget
bindkey -M emacs '^T' fzf-file-widget
bindkey -M vicmd '^T' fzf-file-widget
bindkey -M viins '^T' fzf-file-widget


################################
#  Run previous command again  #
################################

run-again() {
    zle up-history
    zle accept-line
}
zle -N run-again
bindkey "^K" run-again
