#!/bin/bash

#SBATCH -p sapphire
#SBATCH --time=20:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --mem=32768
#SBATCH --mail-user=twozniak@unimelb.edu.au
#SBATCH --mail-type=ALL
#SBATCH --job-name='jarocm'

module load R/4.5.0
Rscript bpvar_jaroc_miss.R