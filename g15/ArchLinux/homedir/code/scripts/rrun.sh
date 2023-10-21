#!/bin/zsh
source $HOME/.config/zsh/.zshrc
rofi -e "$(zsh -c "$(rofi -dmenu -p 'Run command' -theme-str 'listview {lines: 0;}')" 2>&1 )"
