##Slurm##
#CMS.slurm#
 
#!/bin/bash
#SBATCH -J CMS                    # Job name
#SBATCH -o CMS.out                # Name of stdout output file
#SBATCH -e CMS.err                # Name of stderr error file
#SBATCH -p normal                 # Queue (partition) name
#SBATCH -N 1                      # Total # of nodes (must be 1 for serial)
#SBATCH -n 1                      # Total # of mpi tasks (should be 1 for serial)
#SBATCH -t 03:00:00               # Run time (hh:mm:ss)
#SBATCH --mail-user=andrew.fields@tamucc.edu
#SBATCH --mail-type=all           # Send email at begin and end of job
#SBATCH -A Biophysical-Modeling   # Allocation name

module load netcdf

for i in $FILES; do $WORK/bin/cms $i & done
wait

for i in $(cat file.list); do cp expt_$i ;done
