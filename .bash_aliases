alias l='ls'
alias la='ls -A'
alias lsa='ls -a'
alias ll='ls -l'

alias p='python3'
alias ipy='ipython3'

alias open='xdg-open'

# alias rm='rm -I'
alias rm='python3 /usr/local/bin/rm_with_check.py'
alias tasks='grep --exclude-dir=.git -nrEI "TODO|FIXME|TEMP|DEBUG|LOOKUP|TASK" . 2>/dev/null'
alias tasks-keys='echo "TODO|FIXME|TEMP|DEBUG|LOOKUP|TASK"'

alias jobs='jobs -l'

alias R='R -q'
alias grep='rg'

alias icat="kitty +kitten icat"
alias diff="kitty +kitten diff"

# To place inside .bashrc
# if [ -f ~/.bash_aliases ]; then
#     . ~/.bash_aliases
# fi
