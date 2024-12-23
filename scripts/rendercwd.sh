#!/usr/bin/bash

for FILE in *; do echo $FILE && kitty +kitten icat $FILE; done
