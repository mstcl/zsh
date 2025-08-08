#!/usr/bin/env bash

cur=$(pwd)

sudo pacman -S zsh fzf ripgrep fd lesspipe bat chafa zoxide grc eza direnv

mkdir -p ~/.local/share/zsh/plugins
cd ~/.local/share/zsh/plugins

git clone --branch master --depth 1 https://github.com/romkatv/zsh-defer || true
git clone --branch master --depth 1 https://github.com/MichaelAquilina/zsh-you-should-use || true
git clone --branch master --depth 1 https://github.com/zsh-users/zsh-autosuggestions || true
git clone --branch master --depth 1 https://github.com/hlissner/zsh-autopair || true
git clone --branch master --depth 1 https://github.com/jeffreytse/zsh-vi-mode || true
git clone --branch master --depth 1 https://github.com/romkatv/powerlevel10k || true
git clone --branch master --depth 1 https://github.com/zsh-users/zsh-syntax-highlighting || true

git clone --branch main --depth 1 https://github.com/QuarticCat/zsh-smartcache || true
git clone --branch main --depth 1 https://github.com/olets/zsh-window-title || true
git clone --branch main --depth 1 https://github.com/Aloxaf/fzf-tab || true
git clone --branch main --depth 1 https://github.com/Freed-Wu/fzf-tab-source || true

cd "$cur"

ln -s "$cur" $HOME/.config/zsh || true
ln -s "$cur"/.zshenv $HOME/.zhsenv || true
ln -s "$cur"/.lessfilter $HOME/.lessfilter || true
