#!/bin/bash
#
#SBATCH --job-name=Fy5210
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

./Pulse.Y.Bat > /dev/null

