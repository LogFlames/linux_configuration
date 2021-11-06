#!/usr/bin/env bash

echo "Gathering config files"
rsync -a ~/.config/awesome ./ -r
rsync -a ~/.config/kitty ./ -r
rsync -a ~/.config/kak ./ -r
rsync -a ~/.config/htop ./ -r

git status

read -p "Do you wish to push this to github? Enter the commit message, to NOT push press enter: " commit_msg
if [[ ! $commit_msg = "" ]]; then
    git add .
    git commit -m "$commit_msg"
    git push
else
    echo "Nothing has been commited nor pushed"
fi
