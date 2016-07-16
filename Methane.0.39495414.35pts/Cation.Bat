
threads=2
procs=7
NPN=7

export OMP_NUM_THREADS=$threads
mpirun -n $procs -npernode $NPN --bind-to-core --bysocket --cpus-per-proc $threads --report-bindings chmctdhf_sinc Inp=Input.Inp.Cation |tee Outs/Out.cation

