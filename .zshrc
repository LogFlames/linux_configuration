# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias l='ls'
alias ls='ls --color'
alias la='ls -A'
alias lsa='ls -a'
alias ll='ls -l'

alias p='python3'
alias vim=nvim
alias ipy='ipython3'

alias open='xdg-open'

# alias rm='rm -I'
alias rm='python3 /usr/local/bin/rm_with_check.py'
alias tasks='grep --exclude-dir=.git -nrEI "TODO|FIXME|TEMP|DEBUG|LOOKUP|TASK|NOTE" . 2>/dev/null'
alias tasks-keys='echo "TODO|FIXME|TEMP|DEBUG|LOOKUP|TASK|NOTE"'

alias jobs='jobs -l'

alias R='R -q'
alias grep='rg'

alias icat="kitty +kitten icat"
alias diff="kitty +kitten diff"

# To place inside .bashrc
# if [ -f ~/.bash_aliases ]; then
#     . ~/.bash_aliases
# fi

FCEDIT=kak
VISUAL=kak
EDITOR=kak

function em {
emacsclient --create-frame --alternate-editor="" $* > /dev/null &
disown
}

alias kem='emacsclient -e "(kill-emacs)"'

export CODERUN_="chmod +x \$FULL && \$FULL"
export CODERUN_sh="$CODERUN_"
export CODERUN_textart="$CODERUN_sh"
export CODERUN_bash="bash \$FULL"
export CODERUN_zsh="zsh \$FULL"
export CODERUN_fish="fish \$FULL"
export CODERUN_1="man \$FULL"
export CODERUN_2="$CODERUN_1"
export CODERUN_3="$CODERUN_1"
export CODERUN_4="$CODERUN_1"
export CODERUN_5="$CODERUN_1"
export CODERUN_6="$CODERUN_1"
export CODERUN_7="$CODERUN_1"
export CODERUN_8="$CODERUN_1"
export CODERUN_9="$CODERUN_1"
export CODERUN_js="node \$FULL"
export CODERUN_cjs="$CODERUN_js"
export CODERUN_mjs="$CODERUN_js"
export CODERUN_java="cd \$DIRECTORY && javac \$FILE && java \$NAME"
export CODERUN_class="$CODERUN_java"
export CODERUN_jar="$CODERUN_java"
export CODERUN_c="cd \$DIRECTORY && gcc \$FILE -o \$NAME && \$DIRECTORY/\$NAME"
export CODERUN_h="$CODERUN_c"
export CODERUN_cc="cd \$DIRECTORY && g++ \$FILE -o \$NAME && \$DIRECTORY/\$NAME"
export CODERUN_C="$CODERUN_cc"
export CODERUN_cpp="$CODERUN_cc"
export CODERUN_cxx="$CODERUN_cc"
export CODERUN_hh="$CODERUN_cc"
export CODERUN_H="$CODERUN_cc"
export CODERUN_hpp="$CODERUN_cc"
export CODERUN_hxx="$CODERUN_cc"
export CODERUN_m="cd \$DIRECTORY && gcc -framework Cocoa \$FILE -o \$NAME && \$DIRECTORY/\$NAME"
export CODERUN_mm="$CODERUN_m"
export CODERUN_M="$CODERUN_m"
export CODERUN_php="php \$FULL"
export CODERUN_phtml="$CODERUN_php"
export CODERUN_php3="$CODERUN_php"
export CODERUN_php4="$CODERUN_php"
export CODERUN_php5="$CODERUN_php"
export CODERUN_php7="$CODERUN_php"
export CODERUN_phps="$CODERUN_php"
export CODERUN_php_s="$CODERUN_php"
export CODERUN_pht="$CODERUN_php"
export CODERUN_phar="$CODERUN_php"
export CODERUN_py="python -u \$FULL"
export CODERUN_pyi="$CODERUN_py"
export CODERUN_pyc="$CODERUN_py"
export CODERUN_pyd="$CODERUN_py"
export CODERUN_pyo="$CODERUN_py"
export CODERUN_pyw="$CODERUN_py"
export CODERUN_pyz="$CODERUN_py"
export CODERUN_perl="perl \$FULL"
export CODERUN_plx="$CODERUN_perl"
export CODERUN_pl="$CODERUN_perl"
export CODERUN_pm="$CODERUN_perl"
export CODERUN_xs="$CODERUN_perl"
export CODERUN_t="$CODERUN_perl"
export CODERUN_pod="$CODERUN_perl"
export CODERUN_rb="ruby \$FULL"
export CODERUN_go="go run \$FULL"
export CODERUN_gccgo="$CODERUN_go"
export CODERUN_lua="lua \$FULL"
export CODERUN_groovy="groovy \$FULL"
export CODERUN_gvy="$CODERUN_groovy"
export CODERUN_gy="$CODERUN_groovy"
export CODERUN_gsh="$CODERUN_groovy"
export CODERUN_ps1="powershell -ExecutionPolicy ByPass -File \$FULL"
export CODERUN_ps1xml="$CODERUN_ps1"
export CODERUN_psc1="$CODERUN_ps1"
export CODERUN_psd1="$CODERUN_ps1"
export CODERUN_psm1="$CODERUN_ps1"
export CODERUN_pssc="$CODERUN_ps1"
export CODERUN_psrc="$CODERUN_ps1"
export CODERUN_cdxml="$CODERUN_ps1"
export CODERUN_cmd="cmd /c \$FULL"
export CODERUN_bat="$CODERUN_cmd"
export CODERUN_btm="$CODERUN_cmd"
export CODERUN_fsi="fsi \$FULL"
export CODERUN_fs="$CODERUN_fsi"
export CODERUN_fsx="$CODERUN_fsi"
export CODERUN_fsscript="$CODERUN_fsi"
export CODERUN_cs="scriptcs \$FULL"
export CODERUN_csx="$CODERUN_cs"
export CODERUN_vbs="cscript //Nologo \$FULL"
export CODERUN_vbe="$CODERUN_vbs"
export CODERUN_wsf="$CODERUN_vbs"
export CODERUN_wsc="$CODERUN_vbs"
export CODERUN_ts="ts-node \$FULL"
export CODERUN_tsx="$CODERUN_ts"
export CODERUN_coffee="coffee \$FULL"
export CODERUN_litcoffee="$CODERUN_coffee"
export CODERUN_scala="scala \$FULL"
export CODERUN_sc="$CODERUN_scala"
export CODERUN_swift="swift \$FULL"
export CODERUN_jl="julia \$FULL"
export CODERUN_cr="crystal \$FULL"
export CODERUN_ml="ocaml \$FULL"
export CODERUN_mli="$CODERUN_ml"
export CODERUN_r="Rscript \$FULL"
export CODERUN_rdata="$CODERUN_r"
export CODERUN_rds="$CODERUN_r"
export CODERUN_rda="$CODERUN_r"
export CODERUN_scpt="osascript \$FULL"
export CODERUN_scptd="$CODERUN_scpt"
export CODERUN_applescript="$CODERUN_scpt"
export CODERUN_clj="lein exec \$FULL"
export CODERUN_cljs="$CODERUN_clj"
export CODERUN_cljc="$CODERUN_clj"
export CODERUN_edn="$CODERUN_clj"
export CODERUN_hx="haxe --cwd \$DIRECTORY --run \$NAME"
export CODERUN_hxml="$CODERUN_hx"
export CODERUN_rs="cd \$DIRECTORY && rustc \$FILE && \$DIRECTORY/\$NAME"
export CODERUN_rlib="$CODERUN_rs"
export CODERUN_rkt="racket \$FULL"
export CODERUN_scm="csi -script \$FULL"
export CODERUN_ss="$CODERUN_scm"
export CODERUN_ahk="autohotkey \$FULL"
export CODERUN_au3="autoit3 \$FULL"
export CODERUN_dart="dart \$FULL"
export CODERUN_pp="cd \$DIRECTORY && fpc \$FILE && \$DIRECTORY/\$NAME"
export CODERUN_pas="$CODERUN_pp"
export CODERUN_inc="$CODERUN_pp"
export CODERUN_d="cd \$DIRECTORY && dmd \$FILE && \$DIRECTORY/\$NAME"
export CODERUN_hs="runhaskell \$FULL"
export CODERUN_lhs="$CODERUN_hs"
export CODERUN_nim="nim compile --verbosity:0 --hints:off --run \$FULL"
export CODERUN_nims="$CODERUN_nim"
export CODERUN_nimbls="$CODERUN_nim"
export CODERUN_lisp="sbcl --script \$FULL"
export CODERUN_kit="kitc --run \$FULL"
export CODERUN_v="v run \$FULL"
export CODERUN_sass="sass --style expanded \$FULL"
export CODERUN_scss="scss --style expanded \$FULL"
export CODERUN_less="cd \$DIRECTORY && lessc \$FILE \$NAME.css"
export CODERUN_f="cd \$DIRECTORY && gfortran \$FILE -o \$NAME && \$DIRECTORY/\$NAME"
export CODERUN_for="$CODERUN_f"
export CODERUN_f90="$CODERUN_f"

export TERM=xterm-256color
