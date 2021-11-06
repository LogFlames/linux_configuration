#!/usr/bin/env bash

echo "Gathering config files"
rsync -a ~/.config/awesome ./ -r
rsync -a ~/.config/kitty ./ -r
rsync -a ~/.config/kak ./ -r
rsync -a ~/.config/htop ./ -r

git add .
git commit -m "Automatic push"
git push
