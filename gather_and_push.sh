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
rsync -a ~/.zshrc ./ -r
rsync -a ~/.bash_aliases ./ -r
rsync -a ~/.xbindkeysrc ./
rsync -a ~/.aliases ./aliases -r

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
