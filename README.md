# linux_configuration
Some of my Linux configuration files

## Configuration files for kakoune and kitty-terminal

## Custom python script to require a confirmation code when using rm
Place the rm_with_check.py file at a location of your choosing. Then add this command to your .bash_aliases:

> alias rm='python3 /path/to/rm_with_check.py'

## A changed dvorak layout based on 'se'. 
This comes with minial changes. The 'tilde' key now has an tilde on it. 
> cp se_custom /usr/share/X11/xkb/symbols/se

The second changed, `se_specark` is a bit more special. It contains some weirder keycombination, that, I hope, should be nice to use while programming. 

A great utility while creating these layout are `xev | grep keysym`

## Awesome
There are some awesome config files. 
The config expects `dmenu_run_aliases.sh` to be in `.local/bin/dmenu_run_aliases.sh`. This scripts simply lanch dmenu but load the aliases before. 

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

## OLED Brightness
~~ICC-Brightness~~
This is now done via .xbacklight script, that uses xrandr and some awk (I really should learn it :)) to add or reduce the current brightness.
It currently does so in steps of 0.1 between 0 and 1 and loops at the edges. 
