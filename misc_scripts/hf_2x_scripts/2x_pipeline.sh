#!/bin/bash
#SBATCH --account mp107a
#SBATCH --constraint cpu
#SBATCH --time 05:00:00
#SBATCH --nodes 1
#SBATCH --cpus-per-task 1
#SBATCH --qos regular
#SBATCH --mail-user=tramacciotti@lbl.gov
#SBATCH --mail-type=ALL
#SBATCH --output=jobs/seeded_2x/slurm-%j.out


module load conda
conda activate s4bb-env

export LD_LIBRARY_PATH=$HOME/usr/lib:$LD_LIBRARY_PATH
export PYTHONPATH=$HOME/Projects/ChileResults:$PYTHONPATH


pwd

simtype=("llcdm" "noise" "signoi" "comb")

for sim in "${simtype[@]}"; do
    /usr/bin/time -v python -u db_phase2_calcspec.py "${sim}" 1 20 --nlat 3 --pbs --rlz 0 100 --seed-LTnoise &> jobs/seeded_2x/nlat3_${sim}.out

done


/usr/bin/time -v python -u db_phase2_mlsearch.py 1 20 --nlat 3 --rlz 0 100 --pbs --noffdiag 0 &> jobs/seeded_2x/nlat3.out