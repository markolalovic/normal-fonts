#!/bin/bash

convert -trim M.png M-trimmed.png
convert -trim L.png L-trimmed.png

identify -format '%w %h' M-trimmed.png
convert L-trimmed.png -resize 967x1107! L-trimmed-resized.png

rm L-trimmed.png
