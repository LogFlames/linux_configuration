# linux_configuration
Some of my Linux configuration files

## Configuration files for kakoune and kitty-terminal

## Custom python script to require a confirmation code when using rm
Place the rm_with_check.py file at a location of your choosing. Then add this command to your .bash_aliases:

> alias rm='python3 /path/to/rm_with_check.py'

## A changed dvorak layout based on 'se'. 
This comes with minial changes. The 'tilde' key now has an tilde on it. 
> cp se_custom /usr/share/X11/xkb/symbols/se

## Remove 'Tapping Drag'
[Arch libinput](https://wiki.archlinux.org/index.php/Libinput)
> sudo libinput list-devices
> 
> xinput list-props "Name of touchpad device"
> 
> xinput set-prop "Name of touchpad device" "libinput Tapping Drag Enabled" 0
> 

## Adding undervolting
[https://github.com/georgewhewell/undervolt](https://github.com/georgewhewell/undervolt)
