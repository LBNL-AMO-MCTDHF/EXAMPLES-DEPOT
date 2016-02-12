#!/bin/bash

if [[ "$1 " == " " ]]
then
	echo "need time"
	exit
fi

energy=`grep -A 2 CONV Outs/Out.relax |tail -n 1|tr -s " "|cut -f 2 -d " "`

echo "ENERGY $energy"

chmctdhf_atom Inp=Input.Inp.Fourier.perp Act=17   Eground=$energy T=$1 |tee Outs/Out.projflux.perp.t$1

for file in Dat/xsec.proj.spi.perp_???_001.dat
do
   cp -p $file $file.t$1
done


