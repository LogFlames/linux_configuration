#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

. "$HOME/.cargo/env"
export RANGER_LOAD_DEFAULT_RC=false

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  export _JAVA_AWT_WM_NONREPARENTING=1
  exec sway --unsupported-gpu
fi
