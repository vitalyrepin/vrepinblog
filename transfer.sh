#!/bin/sh

rsync -avr --rsh='ssh -p2222' --delete-after --delete-excluded   _site/ borki@vrepin.org:
