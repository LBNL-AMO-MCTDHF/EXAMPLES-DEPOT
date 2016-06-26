#!/bin/bash

if [[ "$1 " == " " ]]
then
	echo "need time"
	exit
fi

energy=`grep -A 2 CONV Outs/Out.relax |tail -n 1|tr -s " "|cut -f 2 -d " "`

echo "ENERGY $energy"

procs=9
threads=4
NPN=2

export OMP_NUM_THREADS=$threads

mpirun -n $procs -npernode $NPN --bind-to-core --cpus-per-proc $threads chmctdhf_sinc.mako Inp=Input.Inp.Pulse.vel Act=17   Eground=$energy T=$1 |tee Outs/Out.projflux.vel.t$1

for file in Dat/xsec.proj.spi.vel_???_001.dat
do
    cp -p $file $file.t$1
done

