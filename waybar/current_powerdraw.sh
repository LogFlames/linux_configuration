cat /sys/class/power_supply/BAT0/{current_now,voltage_now} | tr '\n' ' ' | awk '{printf "%.2f W", $1*10^-6 * $2 * 10^-6}'
