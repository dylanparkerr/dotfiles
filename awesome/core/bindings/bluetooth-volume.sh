#!/bin/bash
operation=$1
sink=$(pactl list short sinks | grep bluez | sed '0,/bluez_sink/ s/^.*bluez_sink/bluez_sink/' | sed 's/\s.*$//')

echo ${operation}
echo ${sink}

if [ $operation == "increase" ]
then
    pactl set-sink-volume $sink +5%

elif [ $operation == "decrease" ]
then
    pactl set-sink-volume $sink -5%

elif [ $operation == "mute" ]
then
    pactl set-sink-mute $sink toggle

else
    echo "no valid operation"
fi

