# :.config/zsh/.functions
# vim:set fdm=marker foldenable ft=zsh foldlevel=0:

# Double Escape to sudo current line {{{
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
# Defined shortcut keys: [Esc] [Esc]
bindkey "\e\e" sudo-command-line
bindkey -M vicmd '\e\e' sudo-command-line
# }}}
# Make Ctrl-z also resume background process {{{
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
# }}}
# Mkdir and then cd into it {{{
function mkcd
{
    command mkdir $1 && cd $1
}
# }}}
# Git commit {{{
gcm() {
    echo -e "Enter commit message:"
    message=""
    while [ -z "$message" ]
    do
        IFS= read -r message
        wait
        sleep 1
    done
    git commit -m "$message"
    message=""
}
# }}}
# Change fzf-completion commands {{{
_fzf_compgen_path() {
    fd --hidden --follow --exclude ".git" --exclude "pfx" --exclude "dosdevices" --exclude "steamapps" --exclude "drive_c" . "$1"
}
_fzf_compgen_dir() {
    fd --type d --hidden --follow --exclude ".git" --exclude "pfx" --exclude "dosdevices" --exclude "steamapps" --exclude "drive_c" . "$1"
}
# }}}
# Paru fuzzy install {{{
function ins {
    paru -Slq | fzf --border=top --border-label="Select package(s) to install" --preview-window=nohidden --preview 'paru -Si {1}' | xargs -ro paru -S --removemake --cleanafter
}
# }}}
# Paru fuzzy remove {{{
function rem() {
    paru -Qq | fzf -q "$1" --border=top --border-label="Select package(s) to uninstall" --preview-window=nohidden --preview 'paru -Qi {1}' | xargs -ro paru -Rns
}
# }}}
# FZF select + execute history {{{
fzf-history-widget-accept() {
    fzf-history-widget
    zle accept-line
}
zle     -N     fzf-history-widget-accept
bindkey '^R^R' fzf-history-widget-accept
# }}}
# Ripgrep in file {{{
fif() {
    if [ ! "$#" -gt 0 ]; then echo "Need a string to search for!"; return 1; fi
    rg --files-with-matches --no-messages "$1" | fzf --preview-window=nohidden --border-label="Found matches in the following files" --border=top --preview "highlight -O ansi -l {} 2> /dev/null | rg --colors 'match:bg:yellow' --ignore-case --pretty --context 10 '$1' || rg --ignore-case --pretty --context 10 '$1' {}"
}
# }}}
# Neovim {{{
function nvm() {
    prc=$(ps -ef | grep nvim | wc -l)
    if [[ "$prc" -le 1 ]] then
        if [[ "$#" -eq 0 ]]; then
            NVIM_LISTEN_ADDRESS=/tmp/nvimsocket nvim
            return
        else
            NVIM_LISTEN_ADDRESS=/tmp/nvimsocket nvim $(pwd)/$@
            return
        fi
    else
        /usr/bin/nvr --remote $@
        return
    fi
}
# }}}
# Keybinds {{{
run-again() {
    # get previous history item
    zle up-history
    # confirm command
    zle accept-line
}
zle -N run-again
bindkey "^K" run-again
# }}}
