# linux_configuration
Some of my Linux configuration files

## Configuration files for kakoune and kitty-terminal

## Custom python script to require a confirmation code when using rm
Place the rm_with_check.py file at a location of your choosing. Then add this command to your .bash_aliases:

> alias rm='python3 /path/to/rm_with_check.py'

## Custom python script to run command multiple times and time the averege execution time
This probably exists in bash... But when I wrote this I used zsh and found this to be the easiest solution.

## A changed dvorak layout based on 'se'. 
This comes with minial changes. The 'tilde' key now has an tilde on it. 
> cp se_custom /usr/share/X11/xkb/symbols/se

The second changed, `se_specark` is a bit more special. It contains some weirder keycombination, that, I hope, should be nice to use while programming. 

A great utility while creating these layout are `xev | grep keysym` and the website [Table of keysyms in X11](https://www.oreilly.com/library/view/xlib-reference-manual/9780937175262/16_appendix-h.html)

## Awesome
There are some awesome config files. 
The config expects `dmenu_run_aliases.sh` to be in `.local/bin/dmenu_run_aliases.sh`. This scripts simply lanch dmenu but load the aliases before.

In connection with awesome you might also want to use [slock](https://tools.suckless.org/slock/). The service file is in the repo which can be enabled by `systemctl enable slock@user`.

## Polybar

[Siji with ttf support](https://github.com/fauno/siji)

## Remove 'Tapping Drag'
There are used more in my awesome config. To enable tapping and so on, same principle. 
[Arch libinput](https://wiki.archlinux.org/index.php/Libinput)
> sudo libinput list-devices
> 
> xinput list-props "Name of touchpad device"
> 
> xinput set-prop "Name of touchpad device" "libinput Tapping Drag Enabled" 0
> 

## Adding undervolting
[https://github.com/georgewhewell/undervolt](https://github.com/georgewhewell/undervolt)

Service file exists in repo, place in /etc/systemd/system/undervolt.service

## OLED Brightness
~~ICC-Brightness~~
This is now done via .xbacklight script, that uses xrandr and some awk (I really should learn it :)) to add or reduce the current brightness.
It currently does so in steps of 0.1 between 0 and 1 and loops at the edges. 

## Emacs
Install emacs vs 28 (as of 2022-02-27) with native compilation
[https://www.emacswiki.org/emacs/GccEmacs#h5o-5](https://www.emacswiki.org/emacs/GccEmacs#h5o-5)
Then add the doom configuration [https://github.com/hlissner/doom-emacs](https://github.com/hlissner/doom-emacs).

## Zsh

[https://ohmyz.sh/#install](https://ohmyz.sh/#install)
Install syntax highlighting plugin, place in `$ZSH_CUSTOM/plugins`
[https://github.com/zsh-users/zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
