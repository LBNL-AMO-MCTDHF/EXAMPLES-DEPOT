#!/bin/bash
#
#SBATCH --job-name=Fx5210
#
#SBATCH --qos=condo_axl  --account=lr_axl --partition=lr3 --constraint=lr3_c20
#
#SBATCH --nodes=7
#
#SBATCH -t 504:00:00
#
#SBATCH 
#
#

./Pulse.X.Bat > /dev/null

