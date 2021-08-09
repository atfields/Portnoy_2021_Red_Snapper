#!/bin/bash
#Polywoggle.slurm#

#SBATCH -J Polywoggle                                           # Name of the job
#SBATCH -o Polywoggle.out                                       # Name of file that will have program output
#SBATCH -e Polywoggle.err                                       # Name of the file that will have job errors, if any
#SBATCH -N 1                                                    # Number of nodes
#SBATCH -n 20                                                   # Number of cores
#SBATCH -p normal                                               # Partition
#SBATCH --mail-user=andrew.fields@tamucc.edu                    # Email address
#SBATCH --mail-type=end                                         # Email me when the job ends
#SBATCH --time=96:00:00                                         # Time before the script is automatically ended

module load R/gcc7/3.6.1

ls -d node | xargs -P 20 -I {} $WORK/bin/Data_transform.sh {} "*.txt"

wait

ls -d node | xargs -P 20 -I {} $WORK/bin/MultiPolywoggle.r {} "*.txt"
