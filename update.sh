#!/bin/bash

# set config folder based on OS
if [ "$OSTYPE" == "linux-gnu" ]; then
    config="$HOME/.config"
elif [ "$OSTYPE" == "darwin" ]; then
    config="mac"
else
    config="C:\\Users\\Dylan\\AppData\\Local"
fi
echo "config folder: $config"


update_nvim(){
    if [ -d "$config/nvim" ]; then
        echo "updating nvim folder: $config/nvim"
        rm -rf $config/nvim
    fi
    cp -r nvim/ $config/nvim/
}


update_nvim

