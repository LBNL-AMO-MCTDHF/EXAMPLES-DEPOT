#!/bin/bash

eth=`grep -A 2 CONV Outs/Out.shiftneon|tail -n 1 |tr -s " " |cut -f 2 -d " "`

but=`grep -A 2 CONV Outs/Out.shifthelium|tail -n 1 |tr -s " " |cut -f 2 -d " "`

ieth=`grep -A 2 CONV Outs/Out.shiftneon|tail -n 1 |tr -s " " |cut -f 3 -d " "`

ibut=`grep -A 2 CONV Outs/Out.shifthelium|tail -n 1 |tr -s " " |cut -f 3 -d " "`

combine=`grep -A 2 CONV Outs/Out.combine|tail -n 1 |tr -s " " |cut -f 2 -d " "`

icombine=`grep -A 2 CONV Outs/Out.combine|tail -n 1 |tr -s " " |cut -f 3 -d " "`

sum=`echo "$eth + $but " |bc -l`

isum=`echo "$ieth + $ibut " |bc -l`

echo " $sum $isum "

echo " $combine $icombine "




