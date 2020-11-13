#!/bin/bash

convert logo.png -trim logo-trimmed.png
convert logo-trimmed.png -gravity center -extent 3000x3000 logo-extended.png
rm logo-trimmed.png

