#!/bin/bash
echo "========================================================================"

# set config folder based on OS
if [ "$OSTYPE" == "linux-gnu" ]; then
    config="$HOME/.config"
elif [ "$OSTYPE" == "darwin" ]; then
    config="{mac config location}"
else
    config="C:\\Users\\Dylan\\AppData\\Local"
fi


update_nvim(){
    if [ -d "$config/nvim" ]; then
        rm -rf $config/nvim
    fi
    echo "updating nvim folder: $config/nvim"
    cp -r nvim/ $config/nvim/
}


#call updates based on os
if [ "$OSTYPE" == "linux-gnu" ]; then
    echo "os: linux"
    echo "config folder: $config"
    update_nvim
    #next calls
elif [ "$OSTYPE" == "darwin" ]; then
    echo "os: mac"
else
    echo "os: windows"
    echo "config folder: $config"
    update_nvim
fi

echo "========================================================================"
