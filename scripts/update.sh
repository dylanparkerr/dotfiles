#!/bin/bash
direction=$1
echo "========================================================================"

# set config folder based on OS
if [ "$OSTYPE" == "linux-gnu" ]; then
    config="$HOME/.config"
elif [ "$OSTYPE" == "darwin" ]; then
    echo "todo add mac os"
else
    config="$HOME\\AppData\\Local"
fi

echo "config folder: $config"


#call updates based on os
if [ $direction == "fromrepotolocal" ]; then
    echo "copying from git repo to local config"
    cp -r ../nvim $config/
elif [ $direction == "fromlocaltorepo" ]; then
    echo "copying from local config to git repo"
    cp -r $config/nvim ../
else
    echo "invalid direction"
fi

echo "========================================================================"
