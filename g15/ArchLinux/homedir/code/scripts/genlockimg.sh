#!/usr/bin/env sh
convert $1 -blur 0x10 -gravity center -crop 16:9  ~/.cache/.lock.png && convert ~/.cache/.lock.png -resize 2560x1440 ~/.cache/.lock.png
