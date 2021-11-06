#!/usr/bin/env bash

cachedir=${XDG_CACHE_HOME:-"$HOME/.cache"}
if [ -d "$cachedir" ]; then
    cache=$cachedir/dmenu_run
else
    cache=$HOME/.dmenu_cache # if no xdg dir, fall back to dotfile in ~
fi

if [ -f ~/.bash_aliases ]; then
    aliases=( ~/.bash_aliases )
fi

if [ -f ~/.bash_functions ]; then
    functions=( ~/.bash_functions )
fi

source $aliases

cmd=$(
    IFS=:
    (
        stest -flx $PATH
        alias | awk -F '[ =]' '{print $2}'
        compgen -A function
    ) | sort -u | tee "$cache" | dmenu "$@"
   )

if [ -f ~/.bash_aliases ]; then
    if [ ! -z "$(grep '^alias' $aliases|cut -d'=' -f1|grep $cmd)" ] || [ -z $(which $cmd) ]; then
        echo -e "source ~/.bash_aliases \n $cmd" | bash -O expand_aliases &
    else
        exec $cmd &
    fi
fi
