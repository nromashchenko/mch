#!/bin/bash
spin -a phil
gcc pan.c #-DSAFETY
./a.out > log.txt
#./a.out -r phil.trail

