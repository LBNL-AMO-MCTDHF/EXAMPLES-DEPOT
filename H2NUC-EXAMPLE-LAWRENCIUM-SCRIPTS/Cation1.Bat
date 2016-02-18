#!/bin/bash

threads=10
procs=4

export OMP_NUM_THREADS=$threads

mpirun --bysocket -n $procs --bind-to-core --bysocket --cpus-per-proc $threads chmctdhf_diatom Inp=Input.Inp.Cation1 |tee Outs/Out.cation1

