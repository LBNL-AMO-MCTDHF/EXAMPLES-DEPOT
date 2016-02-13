
procs=9
threads=9
NPN=2

 export OMP_NUM_THREADS=$threads
 mpirun  -n $procs -npernode $NPN --bind-to-core --bysocket --cpus-per-proc $threads --report-bindings  chmctdhf_sinc Inp=Input.Inp.Relax |tee Outs/Out.relax



