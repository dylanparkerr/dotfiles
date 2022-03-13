#!/bin/bash
pavucontrol&
sleep 0.5
killall pavucontrol

bluetoothctl power on
pulseaudio --start
bluetoothctl connect 94:DB:56:F7:F3:6E

