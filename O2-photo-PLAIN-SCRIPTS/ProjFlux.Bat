#!/bin/bash

if [[ "$1 " == " " ]]
then
	echo "need time"
	exit
fi

energy=`grep -A 2 CONV Outs/Out.relax |tail -n 1|tr -s " "|cut -f 2 -d " "`

echo "ENERGY $energy"

chmctdhf_diatom Inp=Input.Inp.Fourier$2 Act=17   Eground=$energy T=$1 |tee Outs/Out.projflux$2.t$1

for file in Dat/xsec.proj.spi${2}_???_???.dat
do
	cp -p $file $file.t$1
done

