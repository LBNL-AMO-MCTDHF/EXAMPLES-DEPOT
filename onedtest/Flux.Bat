#!/bin/bash

if [[ "$1 " == " " ]]
then
	echo "need time"
	exit
fi

energy=`grep -A 2 CONV Outs/Out.relax |tail -n 1|tr -s " "|cut -f 2 -d " "`

echo "ENERGY $energy"

procs=9
threads=2
NPN=9

export OMP_NUM_THREADS=$threads

mpirun -n $procs -npernode $NPN --bind-to-core --bysocket --cpus-per-proc $threads chmctdhf_sinc1d Inp=Input.Inp.Pulse Act=16   Eground=$energy T=$1 |tee Outs/Out.flux.t$1

cp -p Dat/xsec.spi.dat Dat/xsec.spi.dat.t$1

