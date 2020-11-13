#!/bin/bash

convert logo.png -trim logo-trimmed.png
convert logo-trimmed.png -gravity center -extent 5000x5000 logo-extended.png

