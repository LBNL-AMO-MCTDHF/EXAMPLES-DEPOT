
threads=1
procs=63
NPN=16

export OMP_NUM_THREADS=$threads
mpirun -n $procs -npernode $NPN --bind-to-core --bysocket --cpus-per-proc $threads --report-bindings chmctdhf_sinc Inp=Input.Inp.Cation |tee Outs/Out.cation

