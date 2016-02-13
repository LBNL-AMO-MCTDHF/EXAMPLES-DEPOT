#!/bin/bash

if [[ "$1 " == " " ]]
then
	echo "need time"
	exit
fi

energy=`grep -A 2 CONV Outs/Out.relax |tail -n 1|tr -s " "|cut -f 2 -d " "`

echo "ENERGY $energy"

procs=9
threads=9
NPN=2

export OMP_NUM_THREADS=$threads

mpirun -n $procs -npernode $NPN --bind-to-core --cpus-per-proc $threads chmctdhf_sinc Inp=Input.Inp.Pulse.vel Act=16   Eground=$energy T=$1 |tee Outs/Out.flux.vel.t$1

cp -p Dat/xsec.spi.vel.dat Dat/xsec.spi.vel.dat.t$1

