$pulse

 pulsetype=2

 omega2=16.52d0
 omega=0.04d0

 intensity=10d0

 velflag=0

 pulsetheta=1.5707963267949d0

 minpulsetime=2000d0
 minpulsetime=0d0

/



$parinp

dendatfile="Dat/denmat.eigs.dat.pulse.x"
denrotfile="Dat/denmat.rotate.dat.pulse.x"

energyshift=(0d0,0.000071980895d0)

numactions=2
numactions=1
actions=20,21
ovlspffiles(1)="Bin/spfs.bin.states"
ovlavectorfiles(1)="Bin/avector.bin.states"
outovl="Dat/Overlaps.x.dat"
dipmodtime=20
diptime=200
xdipfile="Dat/XDipoleexpect.Dat.x"
xdftfile="Dat/XDipoleft.Dat.x"
ydipfile="Dat/YDipoleexpect.Dat.x"
ydftfile="Dat/YDipoleft.Dat.x"
zdipfile="Dat/ZDipoleexpect.Dat.x"
zdftfile="Dat/ZDipoleft.Dat.x"

loadavectorflag=1
avectorfile="Bin/avector.bin.relax"
loadspfflag=1
spffile="Bin/spfs.bin.relax"

saveflag=0

numelec=23

sparseconfigflag=1
sparseopt=0

nspf=15


restrictflag=1
restrictms=1

tdflag=1

par_timestep=0.02d0

parorbsplit=3

/


$sincparinp

orbparflag=.true.
orbparlevel=2

fft_mpi_inplaceflag=1
fft_batchdim=1
fft_circbatchdim=1

numpoints=55
spacing=0.2975614d0

numcenters=3
nuccharges(1:3) = 8,7,8

centershift(1:3,1)= -14 ,-4 , 0 
centershift(1:3,2)=   0 , 2 , 0 
centershift(1:3,3)=  14 ,-4 , 0 

scalingflag=1
smoothness=3d0
scalingdistance=4d0
scalingstretch=2d0
scalingtheta=0.5d0

/
