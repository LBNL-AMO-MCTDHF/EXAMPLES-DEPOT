#!/bin/bash

if [[ "$1 " == " " ]]
then
	echo "need time"
	exit
fi

energy=`grep -A 2 CONV Outs/Out.relax |tail -n 1|tr -s " "|cut -f 2 -d " "`

echo "ENERGY $energy"

threads=5
procs=4

export OMP_NUM_THREADS=$threads

mpirun --bysocket -n $procs --bind-to-core --bysocket --cpus-per-proc $threads chmctdhf_diatom Inp=Input.Inp.Pulse.perp Act=16   Eground=$energy T=$1 |tee Outs/Out.flux.perp.t$1

cp Dat/xsec.spi.perp.dat Dat/xsec.spi.perp.dat.t$1

