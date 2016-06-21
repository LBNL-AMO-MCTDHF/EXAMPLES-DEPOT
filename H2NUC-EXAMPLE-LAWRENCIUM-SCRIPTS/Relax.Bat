#!/bin/bash

threads=5
procs=4

export OMP_NUM_THREADS=$threads

mpirun --bysocket -n $procs --bind-to-core --bysocket --cpus-per-proc $threads chmctdhf_diatom Inp=Input.Inp.Relax |tee Outs/Out.relax

