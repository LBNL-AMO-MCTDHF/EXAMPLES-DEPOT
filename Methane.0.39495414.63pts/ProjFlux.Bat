#!/bin/bash

if [[ "$1 " == " " ]]
then
	echo "need time"
	exit
fi

energy=`grep -A 2 CONV Outs/Out.relax |tail -n 1|tr -s " "|cut -f 2 -d " "`

echo "ENERGY $energy"

procs=63
threads=1
NPN=16

export OMP_NUM_THREADS=$threads

mpirun -n $procs -npernode $NPN --bind-to-core --cpus-per-proc $threads chmctdhf_sinc Inp=Input.Inp.Pulse Act=17   Eground=$energy T=$1 |tee Outs/Out.projflux.t$1

for file in Dat/xsec.proj.spi_???_001.dat
do
    cp -p $file $file.t$1
done

