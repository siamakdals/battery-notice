charge=`cat /sys/class/power_supply/BAT0/capacity`
if [ $charge = 100 ]
then
  chargState=`upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep state:\.*\discharging`
  if  [ -z "$chargState" ]
  then
    XDG_RUNTIME_DIR=/run/user/$(id -u) notify-send "باتری پره، شارژرو جدا کن!" -i battery-full
  fi
fi

#echo $charge;