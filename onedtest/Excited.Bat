
procs=9
threads=2
NPN=9

 export OMP_NUM_THREADS=$threads
 mpirun  -n $procs -npernode $NPN --bind-to-core --bysocket --cpus-per-proc $threads --report-bindings  chmctdhf_sinc1d Inp=Input.Inp.Excited |tee Outs/Out.excited



