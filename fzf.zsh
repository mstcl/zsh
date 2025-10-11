#################################
#  Local environment variables  #
#################################

# fd default command
FD_FLAGS='--strip-cwd-prefix --follow 2> /dev/null'

#####################
#  Default configs  #
#####################

export FZF_DEFAULT_COMMAND="fd ${FD_FLAGS}"


############
#  Ctrl-R  #
############

export FZF_CTRL_R_OPTS="
    --info=hidden
    --preview 'echo {}'
    --preview-window hidden
    --bind 'enter:accept'"


############
#  Ctrl-T  #
############

export FZF_CTRL_T_COMMAND="fd --color=always ${FD_FLAGS}"
export FZF_CTRL_T_OPTS="
	--preview-window nohidden
    --ansi
    --select-1
    --exit-0"


##########################
#  Tab completion setup  #
##########################

# Use external sources
source $XDG_DATA_HOME/zsh/plugins/fzf-tab-source/*.plugin.zsh

# General
zstyle ':fzf-tab:*' use-fzf-default-opts yes

# Group colors
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
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'

# Kill
zstyle ':fzf-tab:complete:kill:argument-rest' fzf-preview \
    '[[ $group == "[process ID]" ]] && ps --pid=$word -o cmd --no-headers -w -w'

# Systemctl
zstyle ':fzf-tab:complete:systemctl-*:*' fzf-preview \
  'SYSTEMD_COLORS=1 systemctl status $word'

# Env vars
zstyle ':fzf-tab:user-expand::' \
    fzf-preview 'less $word'
zstyle ':fzf-tab:complete:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*' \
	fzf-preview 'echo ${(P)word}'

# Git
zstyle ':fzf-tab:complete:git-(add|diff|restore):*' fzf-preview \
	'git diff $word | delta'
zstyle ':fzf-tab:complete:git-log:*' fzf-preview \
	'git log --color=always $word'
zstyle ':fzf-tab:complete:git-help:*' fzf-preview \
	'git help $word | bat -plman --color=always'
zstyle ':fzf-tab:complete:git-show:*' fzf-preview \
	'case "$group" in
	"commit tag") git show --color=always $word ;;
	*) git show --color=always $word | delta ;;
	esac'
zstyle ':fzf-tab:complete:git-checkout:*' fzf-preview \
	'case "$group" in
	"modified file") git diff $word | delta ;;
	"recent commit object name") git show --color=always $word | delta ;;
	*) git log --color=always $word ;;
	esac'

# Man
zstyle ':fzf-tab:complete:(\\|)run-help' fzf-preview \
  'run-help $word | bat -lman'

zstyle ':fzf-tab:complete:(\\|*/|)man:' fzf-preview \
  'man $word | bat -lman'

# Accept when enter (but not execute)
zstyle ':fzf-tab:*' fzf-bindings 'enter:accept'


########################
#  Zoxide interactive  #
########################

export _ZO_FZF_OPTS="${FZF_DEFAULT_OPTS}
    --no-sort
    --preview-window nohidden:border-sharp
    --bind 'ctrl-d:'
    --bind 'ctrl-f:'
    --preview '$ERD_PREVIEW'
    --preview-window border-sharp"


##########################
#  Unset local env vars  #
##########################

unset FD_FLAGS
unset FZF_HEIGHT


##########################
#  FZF shell completion  #
##########################
source <(fzf --zsh)
