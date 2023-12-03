###################################
#  Make directory & move into it  #
###################################

function mkcd
{
  command mkdir $1 && cd $1
}


############################
#  Git commit interactive  #
############################

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


#########################
#  Paru install/remove  #
#########################

function ins {
  paru -Sl | sed -r 's/\x1B\[(;?[0-9]{1,3})+[mGK]//g' | \
    awk '{ print $2 " " $4 }' | \
    sed 's/installed/✓/' | \
    fzf --border=top \
    --border-label="Select package(s) to install" \
    --delimiter " " \
    --preview-window=nohidden \
    --preview 'paru -Si {1}' | \
    awk '{ print $1 }' | \
    xargs -ro paru --sudoloop -S --removemake --cleanafter
}
function rem() {
  paru -Qq | fzf -q "$1" --border=top \
    --border-label="Select package(s) to uninstall" \
    --preview-window=nohidden --preview 'paru -Qi {1}' \
    | xargs -ro paru -Rns
}
