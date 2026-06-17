#!/bin/bash
#SBATCH --account mp107a
#SBATCH --constraint cpu
#SBATCH --time 03:30:00
#SBATCH --nodes 1
#SBATCH --cpus-per-task 4
#SBATCH --qos regular
#SBATCH --mail-user=tramacciotti@lbl.gov
#SBATCH --mail-type=ALL
#SBATCH --output=jobs/inj_noise/seeded/test_runs/slurm-%j.out


module load conda
conda activate s4bb-env

export LD_LIBRARY_PATH=$HOME/usr/lib:$LD_LIBRARY_PATH
export PYTHONPATH=$HOME/Projects/ChileResults:$PYTHONPATH
export OMP_NUM_THREADS=4

pwd

simtype=("llcdm" "noise" "signoi" "comb")
dirname="test_runs"

for sim in "${simtype[@]}"; do
    /usr/bin/time -v python -u phase2_calcspec.py "${sim}" 1 20 --nlat 3 --pbs --rlz 0 100 --seed-LTnoise \
    --fpath ${dirname} &> jobs/inj_noise/seeded/${dirname}/nlat3_${sim}.out &

done

wait