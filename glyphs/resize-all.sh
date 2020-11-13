#!/bin/bash
# convert all glyphs to the same size
for f in *.png
do
    convert $f -trim $f 
    convert $f -resize x2000  $f
    convert $f -gravity center -extent 2000x2000 $f
    convert $f -resize 1417x2000! $f
    
    # check new size
    new_size=`identify -format '%w %h' $f`
    if [ "$new_size" != "1417 2000" ]; then
        echo "the size is $new_size"
    fi    
done
