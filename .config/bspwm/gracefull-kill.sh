#!/bin/sh

for d in $(bspc query -N); do
  bspc node $d -c
done
