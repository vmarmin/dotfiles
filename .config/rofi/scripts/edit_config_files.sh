#!/usr/bin/env bash

if [ -z $@ ]
then
function config_files()
{
    # i3-msg -t get_workspaces | tr ',' '\n' | grep "name" | sed 's/"name":"\(.*\)"/\1/g' | sort -n
    echo "alacritty: /home/valentin/Documents/externals/unix_config/alacritty/alacritty.yml"
    echo "compton: /home/valentin/Documents/externals/unix_config/i3/compton.conf"
    echo "i3: /home/valentin/Documents/externals/unix_config/i3/config"
    echo "i3-blocks: /home/valentin/Documents/externals/unix_config/i3/i3blocks.conf"
    echo "i3-scripts: /home/valentin/Documents/externals/unix_config/i3/scripts"
    echo "rofi: /home/valentin/Documents/externals/unix_config/rofi/config.rasi"
    echo "vimrc: ~/.vimrc"
    echo "zshrc: ~/.zshrc"
}

config_files
else
    FILE=$@

    if [ -n x"${FILE}" ]
    then
        f_path=$(echo ${FILE} | sed 's/.*: \(.*\)/\1/g')
        terminator -x vi ${f_path}
    fi
fi
