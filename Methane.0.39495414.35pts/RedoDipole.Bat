#!/bin/bash

if [[ "$1 " == " " ]]
then
	echo "need time"
	exit
fi

procs=7
threads=2
NPN=7

export OMP_NUM_THREADS=$threads

mpirun -n $procs -npernode $NPN --bind-to-core --cpus-per-proc $threads chmctdhf_sinc Inp=Input.Inp.Pulse Act=29 T=$1 |tee Outs/Out.redodipole.t$1

