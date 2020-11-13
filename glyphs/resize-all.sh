#!/bin/bash
# convert all glyphs to the same size
for f in *.png
do
    convert $f -resize 1050x1510! $f
    
    # check new size
    new_size=`identify -format '%w %h' $f`
    if [ "$new_size" != "1050 1510" ]; then
        echo "the size is $new_size"
    fi
done
