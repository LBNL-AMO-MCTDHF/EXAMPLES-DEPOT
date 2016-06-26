
procs=9
threads=4
NPN=2

 export OMP_NUM_THREADS=$threads
 mpirun  -n $procs -npernode $NPN --bind-to-core --bysocket --cpus-per-proc $threads --report-bindings  chmctdhf_sinc.mako Inp=Input.Inp.Pulse.vel |tee Outs/Out.pulse.vel



