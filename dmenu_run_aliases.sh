#!/usr/bin/env bash

cachedir=${XDG_CACHE_HOME:-"$HOME/.cache"}
if [ -d "$cachedir" ]; then
    cache=$cachedir/dmenu_run
else
    cache=$HOME/.dmenu_cache
fi

if [ -f ~/.bash_aliases ]; then
    aliases=( ~/.bash_aliases )
fi

if [ -f ~/.bash_functions ]; then
    functions=( ~/.bash_functions )
fi

source $aliases

cmd=`(
IFS=:
    if stest -dqr -n "$cache" $PATH || stest -fqr -n "$cache" "$aliases" || stest -fqr -n "$cache" "$functions"; then
        (
        stest -flx $PATH
        alias | awk -F '[ =]' '{print $2}'
        compgen -A function
        ) | sort -u | tee "$cache" | dmenu "$@"
    else
        dmenu "$@" < "$cache"
    fi
   )`

if [ -f ~/.bash_aliases ]; then
    if [ ! -z "$(grep '^alias' $aliases|cut -d'=' -f1|grep $cmd)" ] || [ -z $(which $cmd) ]; then
        echo -e "source ~/.bash_aliases \n $cmd" | bash -O expand_aliases &
    else
        exec $cmd &
    fi
fi