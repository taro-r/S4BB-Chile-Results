#!/bin/bash
#SBATCH --account mp107a
#SBATCH --constraint cpu
#SBATCH --time 00:05:00
#SBATCH --nodes 1
#SBATCH --cpus-per-task 1
#SBATCH --qos debug
#SBATCH --mail-user=tramacciotti@lbl.gov
#SBATCH --mail-type=ALL
#SBATCH --output=jobs/batchscript_test.out


module load conda
conda activate s4bb-env

export LD_LIBRARY_PATH=$HOME/usr/lib:$LD_LIBRARY_PATH
export PYTHONPATH=$HOME/Projects/ChileResults:$PYTHONPATH
#export OMP_NUM_THREADS=10

pwd

ls -l

simtype=("llcdm" "noise" "signoi" "comb")
dirname="gauss/gauss_n5"

python phase2_calcspec.py llcdm 1 20 --nlat 3 --rlz 0 100 --pbs --seed-LTnoise --fpath ${dirname} --dry-run