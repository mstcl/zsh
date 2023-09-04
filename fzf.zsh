# :.config/zsh/.fzf
# vim:set fdm=marker foldenable ft=zsh foldlevel=0:

# Default command {{{
export FZF_DEFAULT_COMMAND='rg --files --hidden --no-ignore --follow -g '!{dosdevices}' -g '!{compatdata}' 2> /dev/null'
export FZF_DEFAULT_OPTS="
    --color fg:#574b42,bg:8,hl:1,fg+:7,bg+:#bdb1a8,hl+:9,gutter:8,scrollbar:#574b42,label:1
    --color border:8,info:#574b42,prompt:1,spinner:2,pointer:1,marker:4,separator:8,header:1
    --color preview-bg:#ded8d3,preview-border:#ded8d3,preview-scrollbar:8,preview-label:1
    --height 80%
    --info=inline-right
    --scrollbar='▓'
    --preview-window hidden:border-sharp
    --preview 'bat --color=always -pp --line-range :100 {}'
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
    --bind 'shift-tab:up'"
# }}}
# Ctrl-R {{{
export FZF_CTRL_R_OPTS="
    --info=hidden
    --border=top
    --border-label='Command history'
    --preview-window hidden
    --bind 'enter:accept'"
# }}}
# Ctrl-T {{{
export FZF_CTRL_T_COMMAND='rg --files --hidden --no-ignore --follow -g '!{go/}*' -g '!{.cmake/}*' -g '!{.steam/}*' -g '!{.android/}*' -g '!{.nuget/}*' -g '!{.var/}*' -g '!{.gnome/}*' -g '!{.pvpn-cli/}*' -g '!{.pki}' -g '!{.gnupg/}*' -g '!{.ipypthon/}*' -g '!{.icons/}*' -g '!{.themes/}*' -g '!{.mozilla/}*' -g '!{.paradoxlauncher/}*' -g '!{.ssh/}*' -g '!{.conan}' -g '!{.git}' -g '!{dosdevices}' -g '!{compatdata}' 2> /dev/null'
export FZF_CTRL_T_OPTS="
    --preview-window nohidden
    --border=top
    --border-label='File search'"
# }}}
# Alt-C {{{
export FZF_ALT_C_OPTS="
    --border-label='Enter directory'
    --border=top
    --preview 'erd --color force --hidden -L 1 --no-progress --suppress-size --no-git --no-ignore -x -f -y inverted {}| head -200'
    --preview-window nohidden"
# }}}
# ** Completion {{{
export FZF_COMPLETION_OPTS=$FZF_DEFAULT_OPTS
# }}}
# Tab completion {{{
# Switch group {{{
zstyle ':fzf-tab:*' switch-group 'alt-h' 'alt-l'
# }}}
# Disable sort when completing `git checkout` {{{
zstyle ':completion:*:git-checkout:*' sort false
# }}}
# Set descriptions format to enable group support {{{
zstyle ':completion:*:descriptions' format '[%d]'
# }}}
# Set list-colors to enable filename colorizing {{{
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# }}}
# Preview directory's content with exa when completing cd {{{
zstyle ':fzf-tab:complete:cd:*' fzf-flags --border=top --border-label="Enter directory" --preview-window=nohidden
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
# }}}
# Kill and ps preview {{{
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"
zstyle ':fzf-tab:complete:ps:argument-rest' fzf-preview \
    '[[ $group == "[process ID]" ]] && ps --pid=$word -o cmd --no-headers -w -w'
zstyle ':fzf-tab:complete:ps:argument-rest' fzf-flags --border=top --border-label="Processes" --preview-window=nohidden:down:3:wrap
zstyle ':fzf-tab:complete:kill:argument-rest' fzf-preview \
    '[[ $group == "[process ID]" ]] && ps --pid=$word -o cmd --no-headers -w -w'
zstyle ':fzf-tab:complete:kill:argument-rest' fzf-flags --border=top --border-label="Kill process" --preview-window=nohidden:down:3:wrap
# }}}
# Show systemd units {{{
zstyle ':fzf-tab:complete:systemctl-*:*' fzf-preview 'SYSTEMD_COLORS=1 systemctl status $word'
zstyle ':fzf-tab:complete:systemctl-*:*' fzf-flags --border=top --border-label='Systemd services' --preview-window=down:4:nohidden:wrap
# }}}
# Env vars {{{
zstyle ':fzf-tab:complete:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*' \
    fzf-preview 'echo ${(P)word}'
# }}}
# Git {{{
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
# }}}
# Man {{{
zstyle ':fzf-tab:complete:(\\|)run-help:*' fzf-preview 'run-help $word'
zstyle ':fzf-tab:complete:(\\|*/|)man:*' fzf-preview 'man $word'
# }}}
# Accept line enter (removed) {{{
zstyle ':fzf-tab:*' fzf-bindings 'enter:accept'
# }}}
# }}}
