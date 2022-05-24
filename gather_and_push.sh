#!/usr/bin/env bash

echo "Moving to linux configuration directory"
cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Gathering config files"
rsync -a ~/.config/polybar ./ -r
rsync -a ~/.config/awesome ./ -r
rsync -a ~/.config/kitty ./ -r
rsync -a ~/.config/kak ./ -r
rsync -a ~/.config/htop ./ -r
rsync -a ~/.doom.d/* ./doom.d -r
rsync -a ~/.xbindkeysrc ./
rsync -a ~/.aliases ./aliases -r
rsync -a ~/.local/bin/dmenu_run_aliases.sh ./dmenu_run_aliases.sh -r
rsync -a ~/.zshrc ./zshrc
rsync -a ~/.p10k.zsh p10k.zsh
rsync -a ~/.config/nvim ./nvim -r
rsync -a /usr/local/bin/rm_with_check.py ./ -r
rsync -a /usr/local/bin/timem.py ./ -r

git diff
git add .
git status

read -p "Do you wish to push this to github? Enter the commit message, to NOT push press enter: " commit_msg
if [[ ! $commit_msg = "" ]]; then
    git commit -m "$commit_msg"
    git push
else
    echo "Nothing has been commited nor pushed"
fi
