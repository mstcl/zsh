#################################
#  Local environment variables  #
#################################


# fd default command
FD_FLAGS='--strip-cwd-prefix --follow --no-ignore-vcs 2> /dev/null'

# erd preview command
ERD_PREVIEW="erd --color force --hidden -L 1 --no-progress --suppress-size --no-git \
    --no-ignore -x -f -y inverted {2..} | head -200"

# bat preview command
BAT_PREVIEW="bat --style=numbers,header --color=always {}"

# fzf height
FZF_HEIGHT="80%"


#####################
#  Default configs  #
#####################

export FZF_DEFAULT_COMMAND="fd ${FD_FLAGS}"
export FZF_DEFAULT_OPTS="
    --color fg:#574b42,bg:8,hl:1,fg+:7,bg+:#bdb1a8,hl+:9
    --color gutter:8,scrollbar:#574b42,label:1
    --color border:8,info:#574b42,prompt:1,spinner:2
    --color pointer:1,marker:4,separator:8,header:1
    --color preview-bg:#ded8d3,preview-border:#ded8d3
    --color preview-scrollbar:8,preview-label:1
    --height $FZF_HEIGHT
    --info=inline-right
    --scrollbar='▓'
    --preview-window hidden:border-sharp
    --preview '$BAT_PREVIEW'
    --preview-label='PREVIEW'
    --pointer=' ⇒'
    --marker='✓ '
    --prompt=' [A] ➤ '
    --tabstop=4
    --layout=reverse
    --margin=1,5
    --padding=0,0
    --multi
    --bind 'ctrl-d:change-prompt( [D] ➤ )+reload(fd --type d ${FD_FLAGS})'
    --bind 'ctrl-f:change-prompt( [F] ➤ )+reload(fd --type f ${FD_FLAGS})'
    --bind 'ctrl-a:change-prompt( [A] ➤ )+reload(fd ${FD_FLAGS})'
    --bind '?:toggle-preview'
    --bind 'ctrl-space:toggle'
    --bind 'ctrl-j:toggle-out'
    --bind 'ctrl-k:toggle-in'
    --bind 'enter:accept'
    --bind 'alt-i:accept'
    --bind 'alt-a:toggle-all'
    --bind 'tab:down'
    --bind 'shift-tab:up'"


############
#  Ctrl-R  #
############

export FZF_CTRL_R_OPTS="
    --no-sort
    --info=hidden
    --border=top
    --border-label='Command history'
    --preview-window hidden
    --bind 'enter:accept'"


############
#  Ctrl-T  #
############

export FZF_CTRL_T_COMMAND="fd ${FD_FLAGS}"
export FZF_CTRL_T_OPTS="
    --select-1
    --exit-0
    --border=top
    --border-label='Fuzzy search'"


##########################
#  Tab completion setup  #
##########################

# group colors
FZF_TAB_GROUP_COLORS=(
    $'\033[33m' $'\033[34m' $'\033[33m' $'\033[34m' $'\033[33m' $'\033[34m'
)
zstyle ':fzf-tab:*' group-colors $FZF_TAB_GROUP_COLORS

# Switch group bindings
zstyle ':fzf-tab:*' switch-group 'ctrl-h' 'ctrl-l'

# Disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false

# Set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'

# Set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# Preview directory's content with eza when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-flags \
    --border=top \
    --border-label="Enter directory" \
    --preview-window=nohidden
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'

# Ps
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"
zstyle ':fzf-tab:complete:ps:argument-rest' fzf-preview \
    '[[ $group == "[process ID]" ]] && ps --pid=$word -o cmd --no-headers -w -w'
zstyle ':fzf-tab:complete:ps:argument-rest' fzf-flags \
    --border=top \
    --border-label="Processes" \
    --preview-window=nohidden:up:3:wrap

# Kill
zstyle ':fzf-tab:complete:kill:argument-rest' fzf-preview \
    '[[ $group == "[process ID]" ]] && ps --pid=$word -o cmd --no-headers -w -w'
zstyle ':fzf-tab:complete:kill:argument-rest' fzf-flags \
    --border=top \
    --border-label="Kill process" \
    --preview-window=nohidden:up:3:wrap

# Systemctl
zstyle ':fzf-tab:complete:systemctl-*:*' fzf-preview \
    'SYSTEMD_COLORS=1 systemctl status $word'
zstyle ':fzf-tab:complete:systemctl-*:*' fzf-flags \
    --border=top \
    --border-label='Systemd services' \
    --preview-window=up:nohidden:wrap

# Env vars
zstyle ':fzf-tab:complete:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*' \
    fzf-preview 'echo ${(P)word}'

# Git
zstyle ':fzf-tab:complete:git-(add|diff|restore):*' fzf-preview \
    'git diff $word | bat -p --color=always'
zstyle ':fzf-tab:complete:git-*:*' fzf-flags --preview-window=nohidden
zstyle ':fzf-tab:complete:git-log:*' fzf-preview \
    'git log --color=always $word'
zstyle ':fzf-tab:complete:git-help:*' fzf-preview \
    'git help $word | bat -plman --color=always'
zstyle ':fzf-tab:complete:git-show:*' fzf-preview \
    'case "$group" in
    "commit tag") git show --color=always $word ;;
    *) git show --color=always $word ;;
esac'
zstyle ':fzf-tab:complete:git-checkout:*' fzf-preview \
    'case "$group" in
    "modified file") git diff $word ;;
    "recent commit object name") git show --color=always $word ;;
    *) git log --color=always $word ;;
esac'

# Man
zstyle ':fzf-tab:complete:(\\|)run-help:*' fzf-preview 'run-help $word'
zstyle ':fzf-tab:complete:(\\|*/|)man:*' fzf-preview 'man $word'

# Accept when enter (but not execute)
zstyle ':fzf-tab:*' fzf-bindings 'enter:accept'


########################
#  Zoxide interactive  #
########################

export _ZO_FZF_OPTS="${FZF_DEFAULT_OPTS}
    --no-sort
    --border=top
    --border-label='Quick jump to directory'
    --preview-window nohidden:border-sharp
    --bind 'ctrl-d:'
    --bind 'ctrl-f:'
    --preview '$ERD_PREVIEW'
    --preview-window border-sharp"


##########################
#  Unset local env vars  #
##########################

unset FD_FLAGS
unset ERD_PREVIEW
unset BAT_PREVIEW
unset FZF_HEIGHT
