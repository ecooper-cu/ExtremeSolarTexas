#!/bin/bash

#SBATCH --account=ucb678_asc1
#SBATCH --partition=amilan128c
#SBATCH --job-name=build
#SBATCH --output=out/copper_plate.%j.out
#SBATCH --time=4:00:00
#SBATCH --qos=normal
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=32
#SBATCH --mail-type=ALL
#SBATCH --mail-user=emco4286@colorado.edu

module purge
# module load julia/1.11.6

/curc/sw/install/julia/1.11.6/bin/julia "/home/emco4286/ExtremeSolarTexas/scripts/copper_plate_sim2.jl"